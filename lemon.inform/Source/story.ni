"#error" by "kook"




#error is a room.
Rule for printing the banner text: say "#error" instead.



when play begins:
	change the command prompt to "#error[line break]";
	say "import os[line break]import sys#!";
	say "print >> sys.stderr, 9*9*9#!";
	say "sys.stderr.flush()#!";

