#include <stdio.h>

// print function for tests
void dbg_p(char* message, char* color) {
	printf("\33[0;%sm%s\33[0m\n", color, message);

	return;
}

