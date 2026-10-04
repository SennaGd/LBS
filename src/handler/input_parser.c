#include <stddef.h>
#include <string.h>
#include <stdio.h>

// Fetches first word (i.e. "command") from user input
// Does not include a newline char: '\n'.
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

struct ArgNode {
	char* data;
	struct ArgNode *next;	
};

// Fetches the arguments from user input.
// args pos = sz_cmd + 1
void fetch_args(char input[512], size_t sz_cmd) {
	size_t input_len = strlen(input);
//	printf("\ninput: %s", input);
//	printf("sz_cmd: %zu, in_len: %zu, input: %s\n",  sz_cmd, input_len, input);

	int num_args = 0;
	for (int i = sz_cmd; i<input_len; i++) {
		printf("%c", input[i]);
		
		if (input[i] == ' ' && i < input_len-2) {
			num_args++;
		}
	}
	
	struct ArgNode NODES[num_args];

	// sz_cmd + 1 to skip empty char
	char buf[512];
	int arg_count;
	for (int i = sz_cmd+1; i<input_len; i++) {
		if (input[i] != ' ' && input[i] != '\n') {
			printf("i: %d, char: %c\n", i, input[i]);
			strcpy(&buf[i], &input[i]);
		} 
		else if (input[i] == '\n') {
			break;
		}

		else {
			printf("buf: %s\n", buf);
			arg_count++;
			NODES[arg_count].data = buf;
			NODES[arg_count-1].next = &NODES[arg_count];
			strcpy(buf, "");
		}	
	}
//
//	struct ArgNode *temp = NODES;
//
//	while (temp->next != NULL) {
//		printf("%s", temp->data);
//
//		temp = temp->next;
//
//	} 
}
