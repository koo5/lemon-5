#!/usr/bin/env python

import re
import os
import sys
import time
import select
import traceback # 4 nice errors

minframelen = 2#1.0/30.0
framestart = 0

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
buff = ""

while 1:
  
    #fps    
    lastframelen = time.clock() - framestart
    if lastframelen < minframelen:
	sleep = minframelen - lastframelen
    else:
	sleep = 0.000001
    framestart = time.clock()
    
    #print  >> sys.stderr,"sleep for ",sleep
    
    #stdin
    si,so,se = select.select([sys.stdin],[],[], sleep)
    coma = False
    for s in si:
	if s == sys.stdin:
		buff += sys.stdin.read()
		lines = re.split('(\n>|\^|\`|\!',buff)
		candidates = lines[:-1]
		buff = lines[-1]
		commands.append(map(lambda x: x[1:], filter(lambda x: len(x) > 0 and x[0] in ['`', '!'], candidates)))
		premands.append(map(lambda x: x[1:], filter(lambda x: len(x) > 0 and x[0] == '^', candidates)))
		ready = filter(lambda x: len(x) > 0 and x[0] == '!', candidates).len() > 0
		print >> sys.stderr, candidates

    lastframelen = time.clock() - framestart
    if lastframelen > minframelen:
	if world["loop"]:
	    world["loop"]()

    if not ready: continue
    ready = False

    premands.append(commands)
    command = '\n'.join(premands)

    commands = []
    premands = []
#
    print >> sys.stderr, "ZEE COMMAND IST:\n"+command+"\n<><><>"
#	
    try:
	exec(command, world)
    except Exception, e:
	print >> sys.stderr, ''.join(traceback.format_exception(*sys.exc_info()))
	message("error")


