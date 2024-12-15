#ifndef COMPILER_H_
#define COMPILER_H_

#include <stdio.h>
#include "token.h"

bool handle_token(FILE *j_file, FILE *s_file, token *tok, uint32_t *if_counter, uint32_t *while_counter);

#endif 