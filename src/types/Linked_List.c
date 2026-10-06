#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "linked_list.h"

void list_print(node_t *head) {
	node_t *current = head;

	while (current != NULL) {
		printf("%s\n", current->data);
		current = current->next;
	}
}

void list_push(node_t *head, char val[128]) {
	node_t *current = head;
	while (current->next != NULL) {
		current = current->next; 
	}

	current->next = (node_t *) malloc(sizeof(node_t));
	strcpy(current->next->data, val);
	current->next->next = NULL;
}

void list_pop() {
	
}

