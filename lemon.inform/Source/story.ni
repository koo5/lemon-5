"UI" by "kook"



error is a room.






[

indentation is a number that varies. 
indentation is 0.

to py (line - indexed text):
	repeat with X running from 0 to indentation - 1:
		now line is "    [line]";
	say "![line]".


To pi (p - indexed text):
	py p;
	increase indentation by 4;

To pu:
	decrease indentation by 4;

To pu (p - indexed text):
	py p;
	pu;

]



chapter action

when play begins:
	say "!from OpenGL.GL import *";
	say "!from OpenGL.GLU import *";
	say "!import pygame";
	say "!from pygame.locals import *";
	say "!import sys";
	say "!pygame.init()";
	say "!screen = pygame.display.set_mode((800, 600), OPENGL|DOUBLEBUF)";
	say "!font = pygame.font.Font(None, 32)";
	say "!glEnable(GL_BLEND)";
	say "!glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)";
	say "!def resize(width, height):";
	say "!    glViewport(0, 0, width, height)";
	say "!    glMatrixMode(GL_PROJECTION)";
	say "!    glLoadIdentity()";
	say "!    gluPerspective(60.0, float(width)/height, .1, 1000.)";
	say "!    glMatrixMode(GL_MODELVIEW)";
	say "!    glLoadIdentity()";
	say "!    glTranslatef(0,0,-500)";
	say "!resize(800,600)";
	say "!def loop():";
	say "!    for event in pygame.event.get():";
	say "!        if event.type == QUIT:";
	say "!            print >> sys.stderr, 'exit'";
	say "!            pygame.quit()";
	say "!            sys.exit()";
	say "!        if event.type == KEYDOWN:";
	say "!            message('key '+ pygame.key.name(event.key))";
	say "^import random";
	say "!    r = random.random()";
	say "!    glClearColor(r,r,r, 0)";
	say "!    glClear(GL_COLOR_BUFFER_BIT |GL_DEPTH_BUFFER_BIT)";
	say "!    pygame.display.flip()";
	say "!go";





chapter Key input


Understand "key [text]" as pressing a key. Pressing a key is an action applying to one topic..
Carry out pressing a key:
	say "[the topic understood] pressed.[line break]";
	





[



chapter control

A control is a kind of thing.
A control has a list of numbers called coordinates. The coordinates are usually {0, 0, 0}.
A control has a list of numbers called color. The color is usually {1, 1, 1, 1}.



]

[

chapter input box

An input box is a kind of control. An input box has some indexed text called usertext.  Usertext of input box is usually "Hellow world!".

To draw (box - an input box):
	say "glEnable(GL_TEXTURE_2D)";
	say "text = font.render('[usertext of box]', True, (255,255,255))";
	say "textureData = pygame.image.tostring(text, 'RGBA')";
	say "width = text.get_width()";
	say "height = text.get_height()";
	say "print >> sys.stderr, '#', 'dims: ',  width, ' ', height, ' ' , width * height";
	say "texture = glGenTextures(1)";
	say "glBindTexture(GL_TEXTURE_2D, texture)";
	say "glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR)";
	say "glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR)";
	say "glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, textureData)";
	say "glBegin(GL_QUADS)";
	say "glColor3f([entry 1 of color of box],[entry 2 of color of box],[entry 3 of color of box])";
	say "glTexCoord2d(0,1)";
	say "glVertex3f([entry 1 of coordinates of box], [entry 2 of coordinates of box], [entry 3 of coordinates of box])";
	say "glTexCoord2d(1,1)";
	say "glVertex3f([entry 1 of coordinates of box]+width, [entry 2 of coordinates of box], [entry 3 of coordinates of box])";
	say "glTexCoord2d(1,0)";
	say "glVertex3f([entry 1 of coordinates of box]+width, [entry 2 of coordinates of box]+height, [entry 3 of coordinates of box])";
	say "glTexCoord2d(0,0)";
	say "glVertex3f([entry 1 of coordinates of box], [entry 2 of coordinates of box]+height, [entry 3 of coordinates of box])";
	say "glEnd()";
	say "glDisable(GL_TEXTURE_2D)";

A test box is an input box.





A point is a kind of thing.
A point has a list of numbers called coordinates. The coordinates are usually {0, 0, 0}.
A point has a list of numbers called color. The color is usually {1, 0, 0, 1}.

Default point is a point.

A triangle is a kind of control.
A triangle has a list of points called points. 
Description of triangle is usually "fuckoff".

A test triangle is a triangle.

When play begins:
	repeat with i running from 1 to 3:
		let new point be a new object cloned from the default point;
		unlink the coordinates of the new point;
		unlink the color of the new point;
		add new point to points of test triangle;
	now coordinates of entry 1 of points of test triangle are { 100,  100, 0};
	now coordinates of entry 2 of points of test triangle are { 100, -100, 0};
	now coordinates of entry 3 of points of test triangle are {-100,  100, 0};
	now color of entry 3 of points of test triangle is {0, 0, 1, 0};





To key input (k - indexed text) for a (t - a triangle):
	say "[k] for [description of t].";
	repeat with p running through points of t:
		increase entry 3 of coordinates of p by 100;

To draw (triangle - a triangle):
	say "glBegin(GL_TRIANGLES)";
	repeat with point running through points of triangle:
		say "glColor4f([entry 1 of color of point],[entry 2 of color of point],[entry 3 of color of point],[entry 4 of color of point])";
		say "glVertex3f([entry 1 of coordinates of point], [entry 2 of coordinates of point], [entry 3 of coordinates of point])";
	say "glEnd()";

]


	