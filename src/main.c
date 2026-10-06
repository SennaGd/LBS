#include <stdio.h>
#include <string.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

#include "debug/tests.c"
#include "input_parser.c"

int main(int argc, char *argv[]) 
{
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	
	const int TESTS_ENABLED = 1;

	char input[512]; 
	
	// Handle input
	if (argc > 1) {
		printf("Hello, %s!\n", argv[1]);

		lua_close(L);
		return 0;
   } 

	// Start Environment
	else if (!TESTS_ENABLED) {
		printf("Welcome to LBS!\n");

		// Input loop
		char buffer[512];
		while ( 1 ) {
			char command[512];

			node_t *head = NULL;
			head = (node_t *) malloc(sizeof(node_t));

			// User input
			printf("\033[0;35m❯ \033[0m");
			fgets(input, sizeof(input), stdin);

			strcpy(command,input);

			int err = fetch_command(command);
			if ( !err ) { continue; }

			err = fetch_args(input, strlen(command), head, L);
			if ( !err ) { continue; }
			
			// Call Lua 
			lua_pushstring(L, command); 
			lua_setglobal(L, "command");

			if (luaL_loadfile(L, "./scripts/handler.lua") || lua_pcall(L, 0, 0, 0)) {
				printf("Error in lua file: \n%s\n", lua_tostring(L, -1));
			}


			strcpy(buffer, "");
		} 
	} else { unit_tests(); } // run tests if TESTS_ENABLED == 1

	lua_close(L);
	return 0;
}
