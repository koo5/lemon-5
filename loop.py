#!/usr/bin/env python

import os
import time
import sys
import traceback # 4 nice errors
import select

minframelen = 3#1.0/30.0
framestart = 0

f = open('P', 'r')

def message (m):
    print >> sys.stderr, '#sending: ', [m]
    sys.stderr.flush()
    print m
    sys.stdout.flush()

world = dict()
world["message"] = message
world["loop"] = False

ready = False
commands = []
premands = []

while 1:
  
    #fps    
    now = time.clock()
    lastframelen = now - framestart
    if lastframelen < minframelen:
	sleep = minframelen - lastframelen
    else:
	sleep = 0.0001
    framestart = now
    
    print  >> sys.stderr,"sleep for ",sleep
    
    #stdin
#    si,so,se = select.select([sys.stdin],[],[], sleep)
#    for s in si:
#	if s == sys.stdin:
#	    inp = sys.stdin.readline().rstrip("\n")
#	    if inp != "":
#		message(inp)

    if world["loop"]:
	world["loop"]()
    #print "look"
    #commands input
    for line in sys.stdin.readline():
	print>>sys.stderr, line
	if line == "!go":
	    ready = True
	    break
	if line[0] == '^':
	    premands.append(line[1:])
	if line[0] == '!':
	    commands.append(line[1:])

    if not ready: continue
    ready = False

    premands.append(commands)
    command = '\n'.join(premands)#.rstrip("\n")

    commands = []
    premands = []

    print >> sys.stderr, "ZEE COMMAND IST:\n"+command+"\n<><><>"
	
    try:
	#thats it. all this scary script does is
	#execute anything the inform7 program throws
	#at it thru the file called P
	exec(command, world)
    except Exception, e:
	print >> sys.stderr, ''.join(traceback.format_exception(*sys.exc_info()))
	message("error")


