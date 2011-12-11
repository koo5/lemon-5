#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import sys
import time
import fcntl
import select
import traceback # 4 nice errors

buf = []
fps = 3.0

#acm = fopen('/dev/ttyACM0', 'r')
#acm = open("fakeacm", 'r')
pycode = open('pycode', 'r')
fcntl.fcntl(pycode, fcntl.F_SETFL, fcntl.fcntl(pycode, fcntl.F_GETFL) | os.O_NONBLOCK)

msgs=[]
free = True

def dbg(m):
	print >> sys.stderr, m
	sys.stderr.flush()

def ping():
	if len(msgs) > 0:
		m = msgs[0]
		del msgs[0]
		print m
		sys.stdout.flush()
		dbg(u"»"+m)
	else:
		free = True

def q(m):
	msgs.append(m)
	if free:
		ping()

def err(e):
	dbg(''.join(traceback.format_exception(*sys.exc_info())))

def run_the_buf():
	global buf
	try:
		exec("\n".join(buf), world)
	except Exception, e:
		err(e)
	except SyntaxError, e:
		err(e)
	finally:
		buf = []

def res(x):
	for c in str(x)+"\n":
		print c
		dbg(u"ƹ"+c)
	sys.stdout.flush()
		




world = dict()
#world["msg"] = msg
world["dbg"] = dbg
world["res"] = res
world["ping"] = ping
world["q"] = q


last_loop_start_time = 0

readbuf = ""

def mainloop():
	global buf, last_loop_start_time, readbuf
	if time.time() - last_loop_start_time > 1.0 / fps :
		last_loop_start_time = time.time()
		if "loop" in world:
			world["loop"]()
		
	wait = 1.0 / fps - time.time() + last_loop_start_time
	if wait <= 0:
		wait = 0.00000001
	#time.sleep(1)
	si,so,se = select.select([sys.stdin, pycode],[],[], wait)
	si.append(pycode)#
	for s in si:
		if s == sys.stdin:
			q(s.readline().rstrip('\n'))
		if s == pycode:
			try:
				readbuf  +=  s.read()
			except Exception, e:
				pass
			finally:
				pass
			for line in readbuf.split("\n")[:-1]:
				line = line.replace('{', '[').replace('}',']').rstrip("#!").rstrip("#...")
				dbg(u"«"+line 	)
#				dbg(len(line))
				if len(buf) > 1 and not line.startswith("    "):
					run_the_buf()
				if len(line) != 1:
					buf.append(line.rstrip('\n'))
				if not line.startswith("    ") and not line.endswith("#..."):
					run_the_buf()
			readbuf = readbuf.split("\n")[-1]
#		if s == acm:
#			line = acm.readline()
#			msg("temp " + line)

#q( "")

while 1:
	mainloop()

 