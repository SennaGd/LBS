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
		dbg_p("× | Command does not match expected result.", "0");
		return 1;
	} 

	dbg_p("✓ Fetched command matches given result.", "32");
	
	printf("\n");
	return 0;
}

int match_arguments(char input[512]) {
	char c_input[512];

	strcpy(c_input, input);

	fetch_command(c_input);
	size_t sz_cmd = strlen(c_input);

	lua_State *L;
	int res = fetch_args(input, sz_cmd, L);

	if (res)	{ return 1; }
	else		{ return 0; }
}

void unit_tests() {
	int result, completed = 0;
	int tests_amount = 0;

	dbg_p("\n[ UNIT TESTS ]\n\n", "35");


	dbg_p("--- Command tests ---\n", "34");
	dbg_p("-- Matching command to result --", "33");
	char input_buf[512] = "hello this is a test!";
	result = match_command(input_buf, "hello\n");
	if ( result == 0) { completed++; tests_amount++; result=0; }
	
	dbg_p("-- Checking if result is lowercase --", "33");
	strcpy( input_buf,"What? does it handle twice?");
	match_command(input_buf, "what?\n");
	if ( result == 0) { completed++; tests_amount++; result=0; }
		
	dbg_p("-- Empty command --", "33");
	strcpy( input_buf,"");
	match_command(input_buf, "");
	if ( result == 0) { completed++; tests_amount++; result=0; }

		
//	dbg_p("--- Handling Arguments ---\n", "34");
//
//	dbg_p("-- Single Argument Given --", "33");
//	strcpy( input_buf,"command argument1");
//	result = match_arguments(input_buf);
//	if (result == 0) { completed++; tests_amount++; result=0; }
//
//	dbg_p("-- No Arguments Given --", "33");
//	strcpy( input_buf,"command ");
//	result = match_arguments(input_buf);
//	if (result == 1) { completed++; tests_amount++; result=0; }
//
//
//	dbg_p("-- 10 Arguments Given --", "33");
//	strcpy( input_buf,"command this is an argument in its own for testing purposes");
//	result = match_arguments(input_buf);
//	if (result == 0) { completed++; tests_amount++; result=0; }


	dbg_p("[ FINISHED UNIT TESTS ]", "35");
	printf("\33[0;36m- %d of %d completed succesfully\33[0m", completed, tests_amount);
}


