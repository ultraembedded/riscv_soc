#!/usr/bin/env python
import sys
import atexit
import termios
import os

orig_term = None

##################################################################
# stdio_init
##################################################################
def stdio_init():
    atexit.register(stdio_close)
    global orig_term
    orig_term = termios.tcgetattr(sys.stdin)
    new_settings = termios.tcgetattr(sys.stdin)
    new_settings[3] = new_settings[3] & ~(termios.ECHO | termios.ICANON)
    new_settings[6][termios.VMIN] = 0
    new_settings[6][termios.VTIME] = 0
    termios.tcsetattr(sys.stdin, termios.TCSADRAIN, new_settings)
##################################################################
# stdio_close
##################################################################
def stdio_close():
    global orig_term
    if orig_term:
        termios.tcsetattr(sys.stdin, termios.TCSADRAIN, orig_term)
##################################################################
# stdio_read
##################################################################
def stdio_read():
    ch = os.read(sys.stdin.fileno(), 1)
    if len(ch) > 0:
        return ch;
    else:
        return None
