#include <stdio.h>

void debug_p(char* message, char* color) {
	printf("\33[0;%sm%s\33[0m\n", color, message);

	return;
}

