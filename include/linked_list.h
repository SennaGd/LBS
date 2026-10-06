#ifndef LINKEDLIST_H
#define LINKEDLIST_H

typedef struct Node {
	char data[128];
	struct Node *next;
} node_t;

void list_print(node_t *head);
void list_push(node_t *head, char val[128]);
void list_pop();
	

#endif
