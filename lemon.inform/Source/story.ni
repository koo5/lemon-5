"#error" by "kook"
"#RANDOMIZE TIMER"



Include (-
[ run Q;
Q();
];
-)

To py (Q - text):
	(- run({-box-quotation-text:Q}); -).

#malfunction is a room.

Rule for printing the banner text: say "#error" instead



the file of result (owned by another project) is called "res";
the file of somethings (owned by another project) is called "wut";

res is indexed text that varies;



to decide if filesystem path (path - indexed text) exists:
	say "res(os.path.exists('[path]'))#!";
	say "nop()#!";
	now res is "[text of the file of result]";
	if res is "True":
		decide on true;
	else if res is "False":
		decide on false;
	else:
		write "'[res]' is now '[text of the file of result]'" to the file of somethings;
		end the story finally saying "dbg('ERROR')#!";


chapter whatever



when play begins:
	change the command prompt to "#[line break]";
[	say "boot()#!";]
[	say "msg('create pygame window')#!";]
	say the startup code;
	if filesystem path "./loop.py" exists:
		say "dbg 'ZZZZZZZZZZZZZyes'#!";
	else:
		say "dbg 'ZZZZZZZZZZZZZno'#!";
	say "msg('pick nose')#!";

Understand "block" as blocking. Blocking is an action applying to nothing.
carry out blocking:
	say "import time#!";
	say "time.sleep(10)#!";

Understand "py [text]" as running a python command. Running a python command is an action applying to one topic.
carry out running a python command:
	say "[the topic understood]#!";



Understand "create pygame window" as pygamin.
Pygamin is an action applying to nothing. 
Carry out pygamin:
	say "dbg('creating window...')#!";
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



rgb color is a kind of value.
1 255 255 specifies an rgb color.



a colored box is a kind of thing.
colored box has an rgb color.
python name of colored box is text that varies; python name of colored box is "colored_box";



a screen is a kind of container. a window is a kind of container. 
error contains a screen called screen 1.
screen 1 contains a window called window 1.
window 1 contains a colored box called test box.

to say the colored box definition: 
	say "class [python name of colored box]:#...";
	say "    r=g=b=200#!";
	say "    def draw(self):#...";
	say "        glBegin(GL_QUADS)#!";
	say "        glColor3f(random.random()/3, random.random()/3,random.random()/3)#!";
	say "        glVertex2f(40,50)#!";
	say "        glVertex2f(140,50)#!";
	say "        glVertex2f(140,150)#!";
	say "        glVertex2f(40,150)#!";
	say "        glEnd()#!";
	say "#!";

to def hellow_orld::
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
	import sys
	import random
	import os
	objects = []
	";
	
to create window:
	py "
	from OpenGL.GL import *
	from OpenGL.GLU import *
	import pygame
	from pygame.locals import *
	fontlist = False
	pygame.init()
	screen = pygame.display.set_mode((800, 600), OPENGL|DOUBLEBUF)
	font = pygame.font.Font(None, 50)
	glEnable(GL_BLEND)
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA)
	";

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
	say "            msg('key '+ pygame.key.name(event.key))#!";
	say "    r = random.random()/15#!";
	say "    glClearColor(r,r,r, 0)#!";
	say "    glClear(GL_COLOR_BUFFER_BIT |GL_DEPTH_BUFFER_BIT)#!";
	say "    for o in objects:#!";
	say "        o.draw()#!";
	say "    hellow_orld()#!";
	say "    pygame.display.flip()#!";






























chapter boot

to say imports:
	py "
	import os
	import sys
	import time
	import select
	import traceback
	";

to def helpers:
	say "def msg(m):#...";
	say "    print m#!";
	say "    sys.stdout.flush()#!";
	say "    print >> sys.stderr, m#!";
	say "    sys.stderr.flush()#!";
	say "def dbg(m):#...";
	say "    print >> sys.stderr, m,#!";
	say "    sys.stderr.flush()#!";
	say "def err(e):#...";
	say "    print >> sys.stderr, 'error'.join(traceback.format_exception(*sys.exc_info()))#!";
	say "def run():#...";
	say "    global buf#!";
	say "    try:#!";
	say "        exec('\n'.join(buf), world)#!";
	say "    except Exception, e:#!";
	say "        err(e)#!";
	say "    except SyntaxError, e:#!";
	say "        err(e)#!";
	say "    finally:#!";
	say "        buf = {}#!";


to say the bootup junk:
	py "
	buf = []
	fps = 3.0
	world = dict()
	world['msg'] = msg
	world['dbg'] = dbg
	last_loop_start_time = 0
	#acm = open('/dev/ttyACM0', 'r')
	#acm = open('fakeacm,' 'r')
	pycode = open('pycode', 'r')
	";

to def the main loop:
	say "def mainloop():#...";
	say "    global buf, last_loop_start_time#!";
	say "    if time.time() - last_loop_start_time > 1.0 / fps :#!";
	say "        last_loop_start_time = time.time()#!";
	say "        if 'loop' in world:#!";
	say "            world{'loop'}()#!";
	say "    wait = 1.0 / fps - time.time() + last_loop_start_time#!";
	say "    if wait <= 0:#!";
	say "        wait = 0.00000001#!";
	say "    si,so,se = select.select({sys.stdin, pycode},{},{}, wait)#!";
	say "    for s in si:#!";
	say "        if s == sys.stdin:#!";
	say "            msg(s.readline().rstrip('\n'))#!";
	say "        if s == pycode:#!";
	say "            line = s.readline()#!";
	say "            dbg(line)#!";
	say "            if len(buf) > 1 and line.endswith('#...\n') and not line.startswith('    '):#!";
	say "                run()#!";
	say "            buf.append(line)#!";
	say "            if not line.startswith('    ') and not line.endswith('#...\n'):#!";
	say "                run()#!";
	[
	#		if s == acm:
	#			line = acm.readline()
	#			msg("temp " + line)
	]				

Understand "boot" as booting. 
Booting is an action applying to nothing.
Carry out booting:
	say "#!/usr/bin/env python[line break]";
	say imports;
	def helpers;
	say the bootup junk;
	def the main loop;



