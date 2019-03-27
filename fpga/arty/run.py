#!/usr/bin/env python2.7
import sys
import argparse
import os

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

    run_path = os.path.dirname(os.path.realpath(__file__)) + "/run"

    cmd = "%s/poke.py -t %s -d %s -b %s -a 0xF0000000 -v 0x0" % (run_path, args.type, args.device, args.baud)
    print cmd
    os.system(cmd)

    cmd = "%s/load.py -t %s -d %s -b %s -f %s -p '%s'" % (run_path, args.type, args.device, args.baud, args.filename, args.progargs)
    print cmd
    os.system(cmd)

    cmd = "%s/console-uart.py -t %s -d %s -b %s -f %s" % (run_path, args.type, args.device, args.baud, args.filename)
    print cmd
    os.system(cmd)

if __name__ == "__main__":
   main(sys.argv[1:])

