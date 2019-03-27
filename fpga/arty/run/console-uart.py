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

bus_if    = None

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

    # Reset
    bus_if.write_gpio(0x0)
    bus_if.write_gpio(0x1)

    stdio_init()

    while True:

        if bus_if.bus.uart.in_waiting > 0:
            ch = bus_if.bus.uart.read(1)
            if ch != None:
                sys.stdout.write(ch)
                sys.stdout.flush()     
        
        ch = stdio_read()
        if ch != None:
            bus_if.bus.uart.write(ch)


if __name__ == "__main__":
   main(sys.argv[1:])
