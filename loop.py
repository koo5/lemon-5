#!/usr/bin/env python

import os
import sys
import time
import select
import traceback # 4 nice errors

buf = []
fps = 30.0

def msg(m):
	print m
	sys.stdout.flush()
	print >> sys.stderr, m
	sys.stderr.flush()

def dbg(m):
	print >> sys.stderr, m
	sys.stderr.flush()

def err(e):
	print >> sys.stderr, 'error'.join(traceback.format_exception(*sys.exc_info()))
	print "error"

def run():
	global buf
	try:
		exec("\n".join(buf), world)
	except Exception, e:
		err(e)
	except SyntaxError, e:
		err(e)
	finally:
		buf = []

world = dict()
world["msg"] = msg
world["dbg"] = dbg

def mainloop(last_loop_start_time):
	global buf
	while 1:
		if time.time() - last_loop_start_time > 1.0 / fps :
			last_loop_start_time = time.time()
			if "loop" in world:
				world["loop"]()
		
		wait = 1.0 / fps - time.time() - last_loop_start_time
		if wait <= 0:
			wait = 0.00000001
		
		si,so,se = select.select([sys.stdin],[],[], wait)
		for s in si:
			if s == sys.stdin:
				line = sys.stdin.readline()
				dbg(line)
				if len(buf) > 1 and line.endswith("#...\n"):
					run()
				buf.append(line)
				if not line.startswith("    ") and not line.endswith("#...\n"):
					run()
					
msg( "look up")

mainloop(0.0)

