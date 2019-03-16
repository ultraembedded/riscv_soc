#!/usr/bin/env python
import sys
import argparse
from elftools.elf.elffile import ELFFile

from bus_interface import *

##################################################################
# Print iterations progress
##################################################################
def print_progress(iteration, total, prefix='', suffix='', decimals=1, bar_length=50):
    str_format = "{0:." + str(decimals) + "f}"
    percents = str_format.format(100 * (iteration / float(total)))
    filled_length = int(round(bar_length * iteration / float(total)))
    bar = 'X' * filled_length + ' ' * (bar_length - filled_length)

    sys.stdout.write('\r%s |%s| %s%s %s' % (prefix, bar, percents, '%', suffix)),

    if iteration == total:
        sys.stdout.write('\n')
    sys.stdout.flush()

##################################################################
# load_elf: Load loadable ELF sections
##################################################################
def load_elf(filename, bus_if):

    f = open(filename, "rb")
    e = ELFFile(f)

    for sg in e.iter_segments():
      load_addr   = sg['p_paddr']
      run_addr    = sg['p_vaddr']
      file_offset = sg['p_offset']
      length      = sg['p_filesz']
      data        = sg.data()      
      if data:
        print "ELF: Loading 0x%x - size %dKB" % (load_addr, (length+1023) / 1024)
        bus_if.write(load_addr, bytearray(data), length)

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
# load_prog_args: Load program arguments
##################################################################
def load_prog_args(filename, bus_if, args):
    args = args.strip()
    if args == "":
        return

    # TODO: Improve this
    # Argument string to list
    _arg_list = args.split('-')
    arg_list = []
    for s in _arg_list:
        s = s.strip()
        if s != "":
            arg_list.append("-" + s)

    # Check if symbols exists
    arg_argc_addr = find_symbol(filename, "arg_argc")
    arg_argv_addr = find_symbol(filename, "arg_argv")

    if arg_argc_addr != 0xFFFFFFFF and arg_argv_addr != 0xFFFFFFFF:

        # Write argument count (argc)
        argc = len(arg_list)
        bus_if.write32(arg_argc_addr, argc)

        # Write strings
        offset     = arg_argv_addr
        str_offset = offset + 4 * argc
        for arg in arg_list:
            buf = bytearray(arg)
            buf.extend("\0")
            # Write pointer to string
            bus_if.write32(offset, str_offset)
            # Write string itself
            bus_if.write(str_offset, buf, len(buf))
            str_offset += len(buf)
            offset     += 4

##################################################################
# Main
##################################################################
def main(argv):
    
    parser = argparse.ArgumentParser()
    parser.add_argument('-t', dest='type',    default='uart',                     help='Device type (uart|ftdi)')
    parser.add_argument('-d', dest='device',  default='/dev/ttyUSB1',             help='Serial Device')
    parser.add_argument('-b', dest='baud',    default=1000000,       type=int,    help='Baud rate')
    parser.add_argument('-f', dest='filename',required=True,                      help='File to load')
    parser.add_argument('-p', dest='progargs',default="",                         help='Program load argument string')
    args = parser.parse_args()

    bus_if = BusInterface(args.type, args.device, args.baud)
    bus_if.set_progress_cb(print_progress)

    # Load ELF into target
    load_elf(args.filename, bus_if)

    bus_if.set_progress_cb(None)

    # Load program arguments
    load_prog_args(args.filename, bus_if, args.progargs)

if __name__ == "__main__":
   main(sys.argv[1:])

