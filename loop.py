#!/usr/bin/env python
import os
import time
import sys
import traceback # 4 nice errors
import select

from OpenGL.GL import *
from OpenGL.GLU import *
import pygame
from pygame.locals import *

def resize(width, height):
    glViewport(0, 0, width, height)
    glMatrixMode(GL_PROJECTION)
    glLoadIdentity()
    gluPerspective(60.0, float(width)/height, .1, 1000.)
    glMatrixMode(GL_MODELVIEW)
    glLoadIdentity()
    glTranslatef(0,0,-500)


def message (m):
    print >> sys.stderr, 'sending: ', [m]
    sys.stderr.flush()
    print m
    sys.stdout.flush()

poke_pygame = False
began = False
drawing = False

pygame.init()

message ("fileoutplx")
message ("start")

while 1:
    #time.sleep(0.05)
    
    si,so,se = select.select([sys.stdin],[],[], 0.0)
    for s in si:
	if s == sys.stdin:
	    inp = sys.stdin.readline().rstrip("\n")
	    if inp != "":
		message(inp)

    if poke_pygame:
	for event in pygame.event.get():
            if event.type == QUIT:
        	print >> sys.stderr, 'exit'
        	pygame.quit()
                sys.exit()
            if event.type == KEYDOWN:
        	message("key "+pygame.key.name(event.key))

    if not os.path.exists('./python'):
	if not drawing: 
	    drawing = True
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

#    message ("confirm a go")

    os.remove('./python')

    del c[0]
    
    if len(c) > 0:
	while (not began) and len(c):
	    if c[0] == "#begin\n":
		began = True
	    else:
		del c[0]

	d = ''
	d = d.join(c)
    
#	print >> sys.stderr, c
	
	try:
	    exec(d)
	except Exception, e:
	    begun = False;
	    print >> sys.stderr, ''.join(traceback.format_exception(*sys.exc_info()))



