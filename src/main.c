#include <stdio.h>
#include <string.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

#include "commands.h"
#include "handler/input_parser.c"


int hello() {
	printf("Hello there!\n");

	return 0;
} 

int main(int argc, char *argv[]) 
{
	char input[512]; 
	
	COMMAND hello_c = {
		"hello", hello,
	};

	struct CMD_LIST cmd_container = {
		hello_c,
	};

	// Handle input
	if (argc > 1) {
        printf("Hello, %s!\n", argv[1]);
	
		return 0;
    } 

	// Start Environment
	else {
		printf("Welcome to LBS!\n");

		// Input loop
		char buffer[512];
		while(1) {
			printf("> ");
			fgets(input, sizeof(input), stdin);
			char command[512];
			strcpy(command,input);

			fetch_command(command);
			fetch_args(input, strlen(command));
			// Check if help command
			if (strcmp(command, "help" ) == 0) {
				printf("This is the help command.\n");
			}

			strcpy(buffer, "");
		}
	}
	return 0;
}
