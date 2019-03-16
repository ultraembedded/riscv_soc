#!/usr/bin/env python
import sys
import argparse
import sys
import atexit
import termios
import os

from elftools.elf.elffile import ELFFile
from bus_interface import *
from stdio import *
from struct import *

STDIN_FILENO       = 0
STDOUT_FILENO      = 1
STDERR_FILENO      = 2

rpc_funcs = { }
bus_if    = None
uart_mode = False

##################################################################
# find_symbol: Find symbol by name in ELF file
##################################################################
def find_symbol(filename, symbolname, unfound_value = 0xFFFFFFFF):

    try:
        f = open(filename, "rb")
        e = ELFFile(f)

        symtab = e.get_section_by_name(".symtab")
        for sym in symtab.iter_symbols():
          sym_addr = sym['st_value']
          sym_len  = sym['st_size']
          if sym.name == symbolname:
            return sym_addr
        return unfound_value
    except:
        return unfound_value

##################################################################
# void fpga_enable_uart(void)
##################################################################
def rpc_fpga_enable_uart(args):
    print "[Console]: Enter UART mode"
    global uart_mode
    uart_mode = True
    return 0;
##################################################################
# read_uint32: Helper which can read multiple uint32
##################################################################
def read_uint32(addr, num):
    arr = [0] * num
    buf = bus_if.read(addr, num * 4)
    for i in range(num):
        arr[i] = unpack("<I", buf[(i * 4):(i * 4)+4])[0]
    return arr

##################################################################
# Main
##################################################################
def main(argv):
    
    parser = argparse.ArgumentParser()
    parser.add_argument('-t', dest='type',   default='uart',                     help='Device type (uart|ftdi)')
    parser.add_argument('-d', dest='device', default='/dev/ttyUSB1',             help='Serial Device')
    parser.add_argument('-b', dest='baud',   default=1000000,       type=int,    help='Baud rate')
    parser.add_argument('-f', dest='filename',required=True,                     help='File to load symbols from')
    args = parser.parse_args()

    global bus_if
    bus_if = BusInterface(args.type, args.device, args.baud)

    sym_ipc_request = find_symbol(args.filename, "ipc_request")
    sym_ipc_frame   = find_symbol(args.filename, "ipc_frame")

    # Register RPC functions
    rpc_funcs[find_symbol(args.filename, "fpga_enable_uart")] = rpc_fpga_enable_uart

    # Reset
    bus_if.write_gpio(0x0)
    if sym_ipc_request != 0xFFFFFFFF:
        bus_if.write32(sym_ipc_request, 0x0)
    if sym_ipc_frame != 0xFFFFFFFF:
        bus_if.write32(sym_ipc_frame, 0x0)
    bus_if.write_gpio(0x1)

    stdio_init()

    global uart_mode
    while True:
        if uart_mode:
            if bus_if.bus.uart.in_waiting > 0:
                ch = bus_if.bus.uart.read(1)
                if ch != None:
                    sys.stdout.write(ch)
                    sys.stdout.flush()     
            
            ch = stdio_read()
            if ch != None:
                bus_if.bus.uart.write(ch)
            continue
        # IPC
        rpc_id  = bus_if.read32(sym_ipc_request)
        if rpc_id != 0:

            # Read args
            sp = bus_if.read32(sym_ipc_frame)
            args = read_uint32(sp , 8)

            # Call RPC function
            found = False
            for fn in rpc_funcs:
                if fn == rpc_id:
                    args[0] = rpc_funcs[rpc_id](args)
                    found = True

            if not found:
                print "Error: Bad RPC ID %x" % rpc_id

            # Result
            bus_if.write32(sp + 0, args[0])

            # Return
            bus_if.write32(sym_ipc_request, 0)


if __name__ == "__main__":
   main(sys.argv[1:])
