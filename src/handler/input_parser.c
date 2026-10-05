#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "Linked_List.c"
#include "string_parser.c"


// Fetches first word (i.e. "command") from user input
//
// - Does not include a newline char: '\n'.
void fetch_command(char cmd[512]) {
	char buf[512];
	// Get command 
	for (int i=0; i<strlen(cmd); i++) {
		if (cmd[i] == ' ' || i > strlen(cmd)-2) {
			buf[i] = '\0'; // escape char on last index

			strcpy(cmd, buf); 
			return;
		} else {
			strcpy(&buf[i], &cmd[i]);
		}
	}

	// check for newline char on last buf index
	if (buf[strlen(buf)-1] == '\n'){
		printf("Error in: cmd_parser.c | FOUND NEWLINE\n");
	}

	strcpy(cmd, buf);
	return;
}


// Fetches the arguments from user input.
void fetch_args(char input[512], size_t sz_cmd, node_t *list) {
	size_t input_len = strlen(input);

	int index = 0;
	char buff[128];

	for (int i = sz_cmd+1; i<input_len; i++) {
		if (input[i] == ' ' || input[i] == '\n' || input[i] == '\0') {
			printf("%s", buff);

			remove_spaces(buff);
			list_push(list, buff);

			memset(&buff[0], ' ', sizeof(buff));
				
			index=0;
		} else {
			memset(&buff[index], input[i], 1*sizeof(char));
			index++;
		}
	}
}
