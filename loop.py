#!/usr/bin/env python
import os
import time
import sys
import traceback # 4 nice errors
import select

def message (m):
    print >> sys.stderr, '#sending: ', [m]
    sys.stderr.flush()
    print m
    sys.stdout.flush()

message ("fileoutplx")
message ("start")

world = dict()
world["message"] = message
world["poke_pygame"] = False
world["began"] = False
world["drawing"] = False

while 1:
    si,so,se = select.select([sys.stdin],[],[], 0.0)
    for s in si:
	if s == sys.stdin:
	    inp = sys.stdin.readline().rstrip("\n")
	    if inp != "":
		message(inp)

    if world["poke_pygame"]:
	world["poke_pygame"]()

    if not os.path.exists('./python'):
	if not world["drawing"]: 
	    world["drawing"] = True
	    message("draw")
	continue

    f = open('python', 'r')
    c = f.read()
    f.close()
    

    
    if len(c) < 1: continue
    if c[0] != '*': continue



    c = c.splitlines(True)

    c = filter(lambda x: (x != "*\n") and (x != "*") and (x != "\n"), c)
    
    if c[-1] != "#go\n": continue

    c = filter(lambda x: (x != "#go\n"), c)


    os.remove('./python')

    del c[0]
    
    if len(c) > 0:
	while (not world["began"]) and len(c):
	    if c[0] == "#begin\n":
		world["began"] = True
	    else:
		del c[0]

	d = ''.join(c).rstrip("\n")
    
	print >> sys.stderr, d
	
	try:
	    exec(d, world)
	except Exception, e:
	    world["began"] = False;
	    print >> sys.stderr, ''.join(traceback.format_exception(*sys.exc_info()))



