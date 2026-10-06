#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "linked_list.h"
#include "input_parser.h"
#include "string_parser.c"


// Fetches first word (i.e. "command") from user input
//
// - Does not include a newline char: '\n'.
int fetch_command(char cmd[512]) {
	char buf[512];
	// Get command 
	for (int i=0; i<strlen(cmd); i++) {
		if (cmd[i] == ' ' || i > strlen(cmd)-2) {
			buf[i] = '\0'; // escape char on last index

			strcpy(cmd, buf); 
			return 1;
		} else {
			strcpy(&buf[i], &cmd[i]);
		}
	}

	// check for newline char on last buf index
	if (buf[strlen(buf)-1] == '\n'){
		printf("Error in: cmd_parser.c | FOUND NEWLINE\n");
		return 0;
	}

	strcpy(cmd, buf);
	return 1;
}


// Fetches the arguments from user input.
int fetch_args(char input[512], size_t sz_cmd, node_t *list, lua_State *L) {
	size_t input_len = strlen(input);

	int index = 0;
	int count = 0;
	char buff[128];
	
	lua_createtable(L, 20, 0);
	for (int i = sz_cmd+1; i<input_len; i++) {
		if (input[i] == ' ' || input[i] == '\n' || input[i] == '\0') {
			remove_spaces(buff);
			list_push(list, buff);

			lua_pushstring(L, buff);
			lua_rawseti(L, -2, count+1);

			memset(&buff[0], ' ', sizeof(buff));
			count++;	
			index=0;
		} else {
			memset(&buff[index], input[i], 1*sizeof(char));
			index++;
		}
	}

	lua_setglobal(L, "arguments");

	return 1;
}
