#!/usr/bin/env python

import os
import sys
import time
import select
import traceback # 4 nice errors

world = dict()

fps = 1#30.0

def msg(m):
	print m
	sys.stdout.flush()
	print >> sys.stderr, m
	sys.stderr.flush()

def error(e):
	print >> sys.stderr, 'error'.join(traceback.format_exception(*sys.exc_info()))
	print "error"

def mainloop(last_loop_start_time):
	while 1:
		last_loop_spent_time = time.clock() - last_loop_start_time
		if last_loop_spent_time > 1.0 / fps :
			last_loop_start_time = time.clock()
			if "loop" in world:
				world["loop"]()
		si,so,se = select.select([sys.stdin],[],[], 000000.1)
		for s in si:
			if s == sys.stdin:
				line = sys.stdin.readline()
				print >> sys.stderr, line
				try:
					exec(line, world)
				except Exception, e:
					error(e)
				except SyntaxError, e:
					error(e)

msg( "look up")

mainloop(0)

