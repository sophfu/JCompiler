#ifndef STACK_H
#define STACK_H

#include <stdbool.h>
#include <stdint.h>

// Struct representing the stack
typedef struct {
    int32_t entries[128];   // arbitrary stack size (128)
    int size;                // index of top of stack (size)
} Stack;

void init_stack(Stack *stack);
bool is_empty(Stack *stack);
bool is_full(Stack *stack);
bool push(Stack *stack, int32_t val);
bool pop(Stack *stack, int32_t *val);
int32_t* peek(Stack *stack);

void print_stack(Stack *stack);

#endif // STACK_H
