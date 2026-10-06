#include <lua.h>
#include <string.h>

#include "dbg_commands.c"
#include "input_parser.h"

// runs all defined tests
int match_command(char input[512], char* result) {
	size_t len = strlen(input);
	input[len] = '\0';

	int res = fetch_command(input); // here input will change.
	
	if (!strcmp(input, result)) {
		debug_p("× | Command does not match expected result.", "0");
		return 1;
	} 

	debug_p("✓ Fetched command matches given result.", "32");
	
	printf("\n");
	return 0;
}

int match_arguments(char input[512], size_t sz_cmd, char* result) {

//	char input[512], size_t sz_cmd, node_t *list, lua_State *L
//	int res = fetch_args();

	
	return 0;
}
void unit_tests() {
	int result, completed = 0;
	int tests_amount = 0;

	debug_p("\n[ UNIT TESTS ]\n", "35");


	debug_p("-- Matching command to result --", "33");
	char input_buf[512] = "hello this is a test!";
	result = match_command(input_buf, "hello\n");
	if ( result == 0) { completed++; tests_amount++; result=0; }
	
	debug_p("-- Checking if result is lowercase --", "33");
	strcpy( input_buf,"What? does it handle twice?");
	match_command(input_buf, "what?\n");
	if ( result == 0) { completed++; tests_amount++; result=0; }
		
	debug_p("-- Empty command --", "33");
	strcpy( input_buf,"");
	match_command(input_buf, "");
	if ( result == 0) { completed++; tests_amount++; result=0; }


	debug_p("[ FINISHED UNIT TESTS ]", "35");
	printf("\33[0;36m- %d of %d completed succesfully\33[0m", completed, tests_amount);
}


