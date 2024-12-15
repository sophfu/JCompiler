#include "stack.h"
#include <stdio.h>

void init_stack(Stack *stack) {
    stack->size = 0;
}

bool is_empty(Stack *stack) {
    return stack->size == 0;
}

bool is_full(Stack *stack) {
    return stack->size == 127; // stack size = 128
}

bool push(Stack *stack, int32_t val) {
    if (is_full(stack)) {
        fprintf(stderr, "Error: Stack overflow\n");
        return false;
    }
    stack->size++;
    stack->entries[stack->size - 1] = val;
    return true;
}

bool pop(Stack *stack, int32_t *val) {
    if (is_empty(stack)) {
        fprintf(stderr, "Error: Stack underflow\n");
        return false;
    }
    stack->size--;
    *val = stack->entries[stack->size];
    return true;
}

int32_t* peek(Stack *stack) {
    if (is_empty(stack)) {
        fprintf(stderr, "Error: Stack is empty\n");
        return NULL;
    }
    return &stack->entries[stack->size];
}

void print_stack(Stack *stack) {
    for (int i = 0; i < stack->size; i++) {
        printf("%d\n", stack->entries[i]);
    }
}