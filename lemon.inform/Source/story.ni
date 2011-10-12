"#error" by "kook"




#error is a room.
Rule for printing the banner text: say "#error" instead.

Include (-
[ run Q;
Q();
];
-)

To py (Q - text):
	(- run({-box-quotation-text:Q}); -).


when play begins:
	change the command prompt to "#";
	[]
	py "import sys
	print >> sys.stderr, 9*9*9
	sys.stderr.flush()
	import random
	import os
	from OpenGL.GL import *
	from OpenGL.GLU import *
	import pygame
	from pygame.locals import *
	fontlist = False
	pygame.init()
	screen = pygame.display.set_mode((800, 600), OPENGL|DOUBLEBUF)
	font = pygame.font.Font(None, 50)
	glEnable(GL_BLEND)
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)";
	[]
	say "def resize(width, height):#...";
	say "    glViewport(0, 0, width, height)#!";
	say "    glMatrixMode(GL_PROJECTION)#!";
	say "    glLoadIdentity()#!";
	say "    gluPerspective(60.0, float(width)/height, .1, 1000.)#!";
	say "    glMatrixMode(GL_MODELVIEW)#!";
	say "    glLoadIdentity()#!";
	say "    glTranslatef(0,0,-500)#!";
	say "resize(800,600)#!";
	say "def text():#...";
	say "    text = font.render('[unicode 9986]✈', True, (255,255,255))#!";
	say "    textureData = pygame.image.tostring(text, 'RGBA')#!";
	say "    width = text.get_width()#!";
	say "    height = text.get_height()#!";
	say "    print >> sys.stderr, '#', 'dims: ',  width, ' ', height, ' ' , width * height#!";
	say "    texture = glGenTextures(1)#!";
	say "    glBindTexture(GL_TEXTURE_2D, texture)#!";
	say "    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR)#!";
	say "    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR)#!";
	say "    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, textureData)#!";
	say "text()#!";
	say "def loop():#...";
	say "    for event in pygame.event.get():#!";
	say "        if event.type == QUIT:#!";
	say "            print >> sys.stderr, 'sys.exit()'#!";
	say "            sys.stderr.flush()#!";
	say "            sys.exit()#!";
	say "        if event.type == KEYDOWN:#!";
	say "            message('key '+ pygame.key.name(event.key))#!";
	say "    r = random.random()/5#!";
	say "    glClearColor(r,r,r, 0)#!";
	say "    glClear(GL_COLOR_BUFFER_BIT |GL_DEPTH_BUFFER_BIT)#!";
	say "    glEnable(GL_TEXTURE_2D)#!";
	say "    glBegin(GL_QUADS)#!";
	say "    glColor3f(1,1,1)#!";
	say "    glTexCoord2d(0,1)#!";
	say "    glVertex3f(0,0,0)#!";
	say "    glTexCoord2d(1,1)#!";
	say "    glVertex3f(100,0,0)#!";
	say "    glTexCoord2d(1,0)#!";
	say "    glVertex3f(100,100,0)#!";
	say "    glTexCoord2d(0,0)#!";
	say "    glVertex3f(0,100,0)#!";
	say "    glEnd()#!";
	say "    glDisable(GL_TEXTURE_2D)#!";
	say "    pygame.display.flip()#!";



a screen is a kind of container. a window is a kind of container. 

error contains a screen called screen 1.
