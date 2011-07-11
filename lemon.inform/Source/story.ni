"aaa" by "kook"

Doupatko is a room.
Include Dynamic Objects by Jesse McGrew.



chapter debug

stdoutplx is a truth state that varies. stdoutplx is usually true.

Understand "stdoutplx" as switching to stdout. Switching to stdout is an action applying to nothing. 
Carry out switching to stdout:
	now stdoutplx is true.
Understand "fileoutplx" as switching to fileout. Switching to fileout is an action applying to nothing. 
Carry out switching to fileout:
	now stdoutplx is false.



chapter the messy bridge

The File of python output is called "python".
Indentation is a number that varies. Indentation is 0.
Buffer is indexed text that varies.
Gone is a truth state that varies. gone is false.

To write to buffer (p - indexed text):
	if p is "#go", and stdoutplx is true:
		rule succeeds;
	repeat with X running from 0 to indentation - 1:
		now buffer is "[buffer] ";
	now buffer is "[buffer][p][line break]";
[	say "flushing [buffer]";]
	flush buffer;
	if p is "#go":
		now gone is true;

To indent (p - indexed text):
	write to buffer p;
	increase indentation by 4;

To pythob (p - indexed text):
	write to buffer p;

To python (p - indexed text):
	write to buffer p;
	if indentation is 0:
		pygo;

To pygo:
	write to buffer "#go";

To go:
	now gone is false;
	append "[buffer]" to file of python output;
[	say "=>[buffer]";]
	now buffer is "";

To flush buffer:
[	say "flushing[line break]";]
	if stdoutplx is true:
		say "[buffer]";
		now buffer is "";
	else:
		if buffer is not empty:
			if file of python output exists:
				if gone is false:
					Go;
				else:
					while file of python output exists:
						let wasting_cpu be true;
					Go;
			else:
				Go;

To finish (p - indexed text):
	write to buffer p;
	finish.

To finish:
	decrease indentation by 4;
	if indentation is 0:
		pygo;



chapter action

Understand "draw" as drawing. Drawing is an action applying to nothing.
Understand "start" as starting. Starting is an action applying to nothing.

Carry out starting:
	pythob "#begin";
	python "from OpenGL.GL import *";
	python "from OpenGL.GLU import *";
	python "import pygame";
	python "from pygame.locals import *";
	python "import sys";
	python "pygame.init()";
	pythob "screen = pygame.display.set_mode((800, 600), HWSURFACE|OPENGL|DOUBLEBUF)";
	indent "def resize(width, height):";
	python "glViewport(0, 0, width, height)";
	python "glMatrixMode(GL_PROJECTION)";
	python "glLoadIdentity()";
	python "gluPerspective(60.0, float(width)/height, .1, 1000.)";
	python "glMatrixMode(GL_MODELVIEW)";
	python "glLoadIdentity()";
	finish "glTranslatef(0,0,-500)";
	python "resize(800,600)";
	pythob "def poke_pygame():";
	pythob "    for event in pygame.event.get():";
	pythob "        if event.type == QUIT:";
	pythob "            print >> sys.stderr, 'exit'";
	pythob "            pygame.quit()";
	pythob "            sys.exit()";
	pythob "        if event.type == KEYDOWN:";
	pythob "            message('key '+pygame.key.name(event.key))";
	python "font = pygame.font.Font(None, 32)";
	python "glEnable(GL_BLEND)";
	python "glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)";
	if indentation is not 0, say "indentation [indentation][line break]".

When play ends:
	if indentation is not 0, say "indentation [indentation][line break]".

Carry out drawing:
	python "glClearColor(0,0, 0, 0.0, 0)";
	python "glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)";
	draw test triangle;
	draw test box;
	python "pygame.display.flip()";
	python "drawing = False";

To draw (triangle - a triangle):
	python "glBegin(GL_TRIANGLES)";
	repeat with point running through points of triangle:
		python "glColor4f([entry 1 of color of point],[entry 2 of color of point],[entry 3 of color of point],[entry 4 of color of point])";
		python "glVertex3f([entry 1 of coordinates of point], [entry 2 of coordinates of point], [entry 3 of coordinates of point])";
	python "glEnd()";









chapter control

A control is a kind of thing.
A control has a list of numbers called coordinates. The coordinates are usually {0, 0, 0}.
A control has a list of numbers called color. The color is usually {1, 1, 1, 1}.







chapter input box

An input box is a kind of control. An input box has some indexed text called usertext.  Usertext of input box is usually "Hellow world!".


To draw (box - an input box):
	python "glEnable(GL_TEXTURE_2D)";
	python "text = font.render('[usertext of box]', True, (255,255,255))";
	python "textureData = pygame.image.tostring(text, 'RGBA')";
	python "width = text.get_width()";
	python "height = text.get_height()";
	python "print >> sys.stderr, '#', 'dims: ',  width, ' ', height, ' ' , width * height";
	python "texture = glGenTextures(1)";
	python "glBindTexture(GL_TEXTURE_2D, texture)";
	python "glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR)";
	python "glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR)";
	python "glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, textureData)";
	python "glBegin(GL_QUADS)";
	python "glColor3f([entry 1 of color of box],[entry 2 of color of box],[entry 3 of color of box])";
	python "glTexCoord2d(0,1)";
	python "glVertex3f([entry 1 of coordinates of box], [entry 2 of coordinates of box], [entry 3 of coordinates of box])";
	python "glTexCoord2d(1,1)";
	python "glVertex3f([entry 1 of coordinates of box]+width, [entry 2 of coordinates of box], [entry 3 of coordinates of box])";
	python "glTexCoord2d(1,0)";
	python "glVertex3f([entry 1 of coordinates of box]+width, [entry 2 of coordinates of box]+height, [entry 3 of coordinates of box])";
	python "glTexCoord2d(0,0)";
	python "glVertex3f([entry 1 of coordinates of box], [entry 2 of coordinates of box]+height, [entry 3 of coordinates of box])";
	python "glEnd()";
	python "glDisable(GL_TEXTURE_2D)";

A test box is an input box.




To unlink (P - property) of (O - object):
    (- DO_UnlinkProp({P}, {O}); -). [see Dynamic Objects for the definition of this routine]

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
	python "glBegin(GL_TRIANGLES)";
	repeat with point running through points of triangle:
		python "glColor4f([entry 1 of color of point],[entry 2 of color of point],[entry 3 of color of point],[entry 4 of color of point])";
		python "glVertex3f([entry 1 of coordinates of point], [entry 2 of coordinates of point], [entry 3 of coordinates of point])";
	python "glEnd()";








chapter Key input

Key input focused control is a thing variable.
When play begins:
	now key input focused control is the test triangle.

Understand "key [text]" as pressing a key. Pressing a key is an action applying to one topic..
Carry out pressing a key:
	say "[the topic understood] pressed.[line break]";
	key input the topic understood for a key input focused control;
	
	
	