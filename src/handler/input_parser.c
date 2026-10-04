#include <string.h>
#include <stdio.h>
#include <ctype.h>
void parse_input(char input[512], char buf[512]) {
	// Get command 
	printf("Input: %s", input);

	for (int i=0; i<strlen(input); i++) {
		if (input[i] == ' ' || i > strlen(input)-2) {
			buf[i] = '\0';
			return;
		} else {
			strcpy(&buf[i], &input[i]);
		}
	}
	if (buf[strlen(buf)-1] == '\n'){
		printf("newline char\n");
	}
	return;
}
