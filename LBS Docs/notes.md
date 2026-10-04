# Main
Input handler 
Command Runner

# LUA
Concurrency 
Commands


## commands
> command_name 
> command_argument(s)

_example_
add backup2 /usr/dev/documents/text.txt
^	^		^ ----> Argument 2
|	| ------------> Argument 1
| ----------------> Command



link links`[Amount of args]`

for *i* in *amount of args* {
	links(i).data = buff `buff should be word like "backup"`
	if links > 0 {
		links(i-1).next = &links(i)  `assign previous node to current`
	} 	
}

**now links should have x amound of arguments**
