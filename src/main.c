#include <stdio.h>
#include <string.h>
#include <lua.h>




int main(int argc, char *argv[]) 
{

	char input[512]; 

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

			if (strcmp(input, "hello\n") == 0) {
				printf("hi, dummy!\n");
			}

		}
	}
		
	return 0;
}
