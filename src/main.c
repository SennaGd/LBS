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
			char command[512];

			node_t *head = NULL;
			head = (node_t *) malloc(sizeof(node_t));

			printf("> ");
			fgets(input, sizeof(input), stdin);

			strcpy(command,input);

			fetch_command(command);
			fetch_args(input, strlen(command), head);
				
			list_print(head);	

			strcpy(buffer, "");
		}
	}
	return 0;
}
