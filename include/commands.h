#ifndef COMMANDS_H
#define COMMANDS_H

typedef struct {
	char* name;		
	int(*ptr)();
} COMMAND;

struct CMD_LIST {
	COMMAND command[10];
};
#endif
