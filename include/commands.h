#ifndef COMMANDS_H
#define COMMANDS_H

typedef struct {
	char* name;		
	int(*ptr)();
} command;


#endif
