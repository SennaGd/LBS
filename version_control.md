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





