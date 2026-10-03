#include <stdio.h>
#include <string.h>
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

#include "commands.h"
#include "handler/handler.c"


int hello() {
	printf("Hello there!\n");

	return 0;
} 

int main(int argc, char *argv[]) 
{

	lua_State *L = luaL_newstate();
	luaL_openlibs(L);

	char input[512]; 
	
	COMMAND hello_c = {
		"hello",
		 hello,
	};

	struct CMD_LIST cmd_container = {
		hello_c,
	};

	// Handle input
	if (argc > 1) {
        printf("Hello, %s!\n", argv[1]);
	
		lua_close(L);	
		return 0;
    } 

	// Start Environment
	else {
		lua_pushstring(L, "this is a variable");
		
		lua_setglobal(L, "hi");

		if (luaL_loadfile(L, "./scripts/handler.lua") || lua_pcall(L, 0, 0, 0)) {
			printf("Error in lua file: \n%s\n", lua_tostring(L, -1));
		}

		printf("Welcome to LBS!\n");

		int luacheck = handler();
		// Input loop
		while(1) {
			fgets(input, sizeof(input), stdin);
			// Loop over commands names in commands list
			// Check if first chars of input (escaping on empty space)
			//
			// Run commands in commands list with args
			if (strcmp(input, "hello\n") == 0) {
				hello_c.ptr();
				printf("%d", luacheck);
			}

		}
	}
	
	lua_close(L);
	return 0;
}
