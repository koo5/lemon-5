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
	change the command prompt to "#";[line break]
	say the colored box definition;
	say the startup code;
	def the resize func;
	say "resize(800,600)#!";
	def text_setup;
	say "text_setup()#!";
	def hellow_orld;
	def loop;
	now rgb color of test box is 0 0 255;
	repeat with object running through every object in window 1:
		say "objects.append([python name of colored box]())";

a screen is a kind of container. a window is a kind of container. 
error contains a screen called screen 1.
screen 1 contains a window called window 1.
window 1 contains a colored box called test box.


rgb color is a kind of value.
1 255 255 specifies an rgb color.


a colored box is a kind of thing.
colored box has an rgb color.
python name of colored box is text that varies; python name of colored box is "colored_box";

to say the colored box definition:
	say "class [python name of colored box]:#...";
	say "    r=g=b=200#!";
	say "    def draw(self):#...";
	say "        glBegin(GL_QUADS)#!";
	say "        glColor3f(self.r, self.g, self.b)#!";
	say "        glVertex2f(40,50)#!";
	say "        glVertex2f(140,50)#!";
	say "        glVertex2f(140,150)#!";
	say "        glVertex2f(40,150)#!";
	say "        glEnd()#!";
	say "#!";

to say the text drawing routine:
	say "def hellow_orld():#...";
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

to say the startup code:
	py "
	objects = []
	import sys
	dbg(2*2)
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

to def the resize func:
	say "def resize(width, height):#...";
	say "    glViewport(0, 0, width, height)#!";
	say "    glMatrixMode(GL_PROJECTION)#!";
	say "    glLoadIdentity()#!";
	say "    gluPerspective(60.0, float(width)/height, .1, 1000.)#!";
	say "    glMatrixMode(GL_MODELVIEW)#!";
	say "    glLoadIdentity()#!";
	say "    glTranslatef(0,0,-500)#!";

to def text_setup:
	say "def text_setup():#...";
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

to def loop:
	say "def loop():#...";
	say "    for event in pygame.event.get():#!";
	say "        if event.type == QUIT:#!";
	say "            print >> sys.stderr, 'sys.exit()'#!";
	say "            sys.stderr.flush()#!";
	say "            sys.exit()#!";
	say "        if event.type == KEYDOWN:#!";
	say "            message('key '+ pygame.key.name(event.key))#!";
	say "    r = random.random()/15#!";
	say "    glClearColor(r,r,r, 0)#!";
	say "    glClear(GL_COLOR_BUFFER_BIT |GL_DEPTH_BUFFER_BIT)#!";
	say "    for o in objects:#!";
	say "        o.draw()#!";
	say "    hellow_orld()#!";
	say "    pygame.display.flip()#!";
