#!/usr/bin/env python

import os
import sys
import time
import select
import traceback # 4 nice errors

buf = []
fps = 3.0

#acm = fopen('/dev/ttyACM0', 'r')
#acm = open("fakeacm", 'r')
pycode = open('pycode', 'r')

def msg(m):
	print m
	sys.stdout.flush()
	print >> sys.stderr, m
	sys.stderr.flush()

def dbg(m):
	print >> sys.stderr, m
	sys.stderr.flush()

def err(e):
	print >> sys.stderr, ''.join(traceback.format_exception(*sys.exc_info()))
	print "error"

def run_buf():
	global buf
	try:
		exec("\n".join(buf), world)
	except Exception, e:
		err(e)
	except SyntaxError, e:
		err(e)
	finally:
		buf = []

def nop():
	pass

def i7_header(f, name):
    f.write("* //72B4F7AB-F525-45F0-B5C7-FF9C0D38BCD7// "+name+"\n")

def res(x):
	time.sleep(10)
	with open('res', 'w') as result:
		i7_header(result, "res")
		result.write(str(x))
		result.close()

world = dict()

world["msg"] = msg
world["dbg"] = dbg
world["res"] = res
world["nop"] = nop

last_loop_start_time = 0

def mainloop():
	global buf, last_loop_start_time
	if time.time() - last_loop_start_time > 1.0 / fps :
		last_loop_start_time = time.time()
		if "loop" in world:
			world["loop"]()
		
	wait = 1.0 / fps - time.time() + last_loop_start_time
	if wait <= 0:
		wait = 0.00000001
	pycode.flush()
	si,so,se = select.select([sys.stdin, pycode],[],[], wait)
	for s in si:
		if s == sys.stdin:
			msg(s.readline().rstrip('\n'))
		if s == pycode:
			line = s.readline().replace('{', '[').replace('}',']')
			dbg(line 	)
#			dbg(len(line))
			if len(buf) > 1 and not line.startswith("    "):
				run_buf()
			if len(line) != 1:
				buf.append(line.rstrip('\n'))
			if not line.startswith("    ") and not line.endswith("#...\n"):
				run_buf()
#		if s == acm:
#			line = acm.readline()
#			msg("temp " + line)

msg( "look up")

while 1:
	mainloop()

