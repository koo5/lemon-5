"aaa" by "kook"

Doupatko is a room.



Chapter 1 - the messsy bridge

The File of python output is called "python".
Indentation is a number that varies. Indentation is 0.
Buffer is indexed text that varies.
Gone is a truth state that varies. gone is false.

To write to buffer (p - indexed text):
	repeat with X running from 0 to indentation - 1:
		now buffer is "[buffer] ";
	now buffer is "[line break][buffer][p][line break]";
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
	say "=>[buffer]";
	now buffer is "";

To flush buffer:
[	say "flushing[line break]";]
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



chapter 2 - action

Understand "draw" as drawing. Drawing is an action applying to nothing.
Understand "start" as starting. Starting is an action applying to nothing.

Carry out starting:
	pythob "#begin";
	pythob "screen = pygame.display.set_mode((800, 600), HWSURFACE|OPENGL|DOUBLEBUF)";
	pythob "resize(800,600)";
	python "poke_pygame = True";
	if indentation is not 0, say "indentation [indentation][line break]".

When play ends:
	if indentation is not 0, say "indentation [indentation][line break]".

Carry out drawing:
	let r be a random number from 0 to 1;
	let g be a random number from 0 to 1;
	let b be a random number from 0 to 1;
	python "glClearColor([r], [g], [b], 0.0)";
	python "glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)";
	draw test triangle;
	python "pygame.display.flip()";
	python "drawing = False";


A point is a kind of thing.
A point has a list of numbers called coordinates. The coordinates are usually {0, 0}.
A point has a list of numbers called color. The color is usually {1, 1, 1}.
Default point is a point.

A triangle is a kind of thing.
A triangle has a list of points called points. Points are usually {default point, default point, default point}.

A test triangle is a triangle. 

[
When play begins:
	repeat with point running through points of test triangle:
		now coordinates of point are {100, 100}.
]

When play begins:
	now coordinates of entry 1 of points of test triangle are { 100,  100};
	now coordinates of entry 2 of points of test triangle are { 100, -100};
	now coordinates of entry 3 of points of test triangle are {-100,  100};


To draw (triangle - a triangle):
	python "glBegin(GL_TRIANGLES)";
	repeat with point running through points of triangle:
		python "glColor3f([entry 1 of color of point],[entry 2 of color of point],[entry 3 of color of point])";
		python "glVertex2f([entry 1 of coordinates of point], [entry 2 of coordinates of point])";
	python "glEnd()";


