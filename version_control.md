# file "hello.py" | Version 1
1. var = "hello" 
2. 
3. def hello(var):
4.	print(var)
5. return
6.


# file "hello.py" | Version 2
1. var = "hi there!" 
2. 
3. def hello(var, name):
1.  var = var + name
1.	print(var)
1. return
1.


## version icons
"+" added / newline
"-" removed
"~" changed
"=" did not change


# hello.py.ver 
.  (1)
1+ var = "hello"
2+ 
3+ def hello(var):
4+ print(var)
5+ return
6+ 
.   (2)
1~ var = "hi there!"
3~ def hello(var, name): 
4+ var = var + name

^^^^^^^^^^^^^^^^^^^^^^^^^
### adding lines in between
ver 1 line 4 | ver 2 line 4
print(var)	 ~  var = var + name

**if ver 2 line 4 ~= ver 1 line 4**
*line 5 = ver 1 line 4*




		Prev(0)		Curr(1)		Next(2)
old 	nil			print("")	""	
new		nil			print("")	""	

1 == 1
		Prev(1)		Curr(2)		Next(3)
old 	print("")	""			Egg
new		print("")	""			""
2 == 2 ==== EQUALS

		Prev(2)		Curr(3)		Next(4)
old 	""			Egg			Nil
new		""			""			Egg

3 != 3 --\
		  ----- if old_curr != new_curr
		  ----- if old_curr == new_next ==== OLD_CURR MOVED DOWN
		  ----- if old_prev == new_curr

3 == 4 --/
2 == 3 -/

		Prev(0)		Curr(1)		Next(2)
old 	Nil			hello world	Nil
new		Nil			hi world	Nil

1 != 1 --\
2 == 2	  ---- if old_curr != new_curr 
		  ---- if old_prev != new_prev ==== OLD_CURR CHANGED
		  ---- if old_next != new_next
0 == 0 --/


		Prev(3)		Curr(4)		Next(5)
old		Nil			Egg			Balls
new		Egg			Balls		Nil

4 != 4 -\
4 == 3 --\
3 == 4	  ---- if old_curr != new_curr
		  ---- if old_curr == new_prev
		  ---- if old_prev != new_curr ==== OLD_CURR MOVED UP
		  ---- if old_next == new_curr
		  ---- if old_prev != new_prev
5 == 4 --/


