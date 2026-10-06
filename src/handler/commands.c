#include "commands.h"
#include <stdio.h>
#include "input_parser.c"

int backup_f() {
	printf("Hello there!\n");
	return 0;
} 

struct CMD_LIST generate_cmd_list() {
	COMMAND create_backup_file = {
		"new", backup_f,
	};

	struct CMD_LIST cmd_arr = {
		create_backup_file,
	};

	return cmd_arr;
}

