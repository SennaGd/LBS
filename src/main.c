#include <stdio.h>
#include <string.h>
#include <lua.h>
#include "commands.h"



int hello() {
	printf("Hello there!");

	return 0;
} 

int main(int argc, char *argv[]) 
{

	char input[512]; 
	
	command hello_c = {
		"hello",
		hello,
	};
	// Handle input
	if (argc > 1)
    {
        printf("Hello, %s!\n", argv[1]);

		return 0;
    } 


	// Start Environment
	else {
		printf("Welcome to LBS!\n");

		// Input loop
		while(1) {
			fgets(input, sizeof(input), stdin);


			// Loop over commands names in commands list
			// Check if first chars of input (escaping on empty space)
			//
			// Run commands in commands list with args

			
			if (strcmp(input, "hello\n") == 0) {
				hello_c.ptr();
				printf("hi, dummy!\n");
			}

		}
	}
		
	return 0;
}
