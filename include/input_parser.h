#ifndef INPUTPARSER_H
#define INPUTPARSER_H

#include <lua.h>

#include "Linked_List.c"


int fetch_command(char cmd[512]);
int fetch_args(char input[512], size_t sz_cmd, node_t *list, lua_State *L);


#endif
