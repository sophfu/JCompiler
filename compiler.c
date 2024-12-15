
#include <stdio.h>
#include "token.h"

void push_stack(FILE *s_file, char* register_name) {
    fprintf(s_file, "ADDI sp, sp, -4\n");                  // decrement stack pointer
    fprintf(s_file, "SW %s, 0(sp)\n", register_name);      // push x5 to stack
}

void pop_stack(FILE *s_file, char* register_name) {
    fprintf(s_file, "LW %s, 0(sp)\n", register_name);   // load top of stack into given register
    fprintf(s_file, "ADDI sp, sp, 4\n");                // increment stack pointer
}

void peek_stack(FILE *s_file, char* register_name) {
    fprintf(s_file, "LW %s, 0(sp)\n", register_name);   // load top of stack into given register
}

bool handle_token(FILE *j_file, FILE *s_file, token *tok, uint32_t *if_counter, uint32_t *while_counter) {
    if (tok->type == LITERAL) {
        if (-2048 <= tok->literal_value && tok->literal_value <= 2047) {
            fprintf(s_file, "ADDI x5, x0, %d\n", tok->literal_value);   // load literal into x5
        } else {
            uint32_t upper_10 = tok->literal_value >> 22;
            uint32_t middle_11 = (tok->literal_value >> 11) & 0x7FF;
            uint32_t lower_11 = tok->literal_value & 0x7FF;

            fprintf(s_file, "ADDI x5, x0, %d\n", upper_10);     // load upper 10 bits into x5
            fprintf(s_file, "SLLI x5, x5, 11\n");               // make room for middle 11
            fprintf(s_file, "ADDI x5, x5, %d\n", middle_11);    // add middle 12 bits to x5
            fprintf(s_file, "SLLI x5, x5, 11\n");               // make room for lower 11
            fprintf(s_file, "ADDI x5, x5, %d\n", lower_11);     // add lower 12 bits to x5
        }
        push_stack(s_file, "x5");                           // push x5 to stack
        fprintf(s_file, "\n");
    }
    if (tok->type == PLUS) {
        pop_stack(s_file, "x5");                // pop from stack, store in x5
        pop_stack(s_file, "x6");                // pop from stack, store in x6
        fprintf(s_file, "ADD x5, x5, x6\n");    // add x5 and x6, store in x5
        push_stack(s_file, "x5");               // push x5 to stack
        fprintf(s_file, "\n");
    }
    if (tok->type == MINUS) {
        pop_stack(s_file, "x5");                
        pop_stack(s_file, "x6");                
        fprintf(s_file, "SUB x5, x5, x6\n");    
        push_stack(s_file, "x5");               
        fprintf(s_file, "\n");
    }
    if (tok->type == MUL) {
        pop_stack(s_file, "x5");                
        pop_stack(s_file, "x6");                
        fprintf(s_file, "MUL x5, x5, x6\n");    
        push_stack(s_file, "x5");               
        fprintf(s_file, "\n");
    }
    if (tok->type == DIV) {
        pop_stack(s_file, "x5");                
        pop_stack(s_file, "x6");                
        fprintf(s_file, "DIV x5, x5, x6\n");    
        push_stack(s_file, "x5");               
        fprintf(s_file, "\n");
    }
    if (tok->type == MOD) {
        pop_stack(s_file, "x5");                
        pop_stack(s_file, "x6");                
        fprintf(s_file, "REM x5, x5, x6\n");    
        push_stack(s_file, "x5");               
        fprintf(s_file, "\n");
    }
    if (tok->type == AND) {
        pop_stack(s_file, "x5");                
        pop_stack(s_file, "x6");                
        fprintf(s_file, "AND x5, x5, x6\n");    
        push_stack(s_file, "x5");               
        fprintf(s_file, "\n");
    }
    if (tok->type == OR) {
        pop_stack(s_file, "x5");                
        pop_stack(s_file, "x6");                
        fprintf(s_file, "OR x5, x5, x6\n");    
        push_stack(s_file, "x5");               
        fprintf(s_file, "\n");
    }
    if (tok->type == NOT) {
        pop_stack(s_file, "x5");                    // pop from stack, store in x5
        fprintf(s_file, "ADDI x6, x0, -1\n");       // load -1 into x6
        fprintf(s_file, "MUL x5, x5, x6\n");        // multiply x5 and x6
        fprintf(s_file, "ADDI x5, x5, -1\n");       // subtract by 1
        push_stack(s_file, "x5");                   // push x5 to stack
        fprintf(s_file, "\n");
    }
    if (tok->type == LT) {
        pop_stack(s_file, "x5");
        pop_stack(s_file, "x6");
        fprintf(s_file, "SLT x5, x5, x6\n");
        push_stack(s_file, "x5");
        fprintf(s_file, "\n");
    }
    if (tok->type == LE) {
        pop_stack(s_file, "x5");
        pop_stack(s_file, "x6");
        fprintf(s_file, "SLT x5, x6, x5\n");        // x5 <= x6, !(x6 < x5)
        fprintf(s_file, "XORI x5, x5, 1\n");
        push_stack(s_file, "x5");
        fprintf(s_file, "\n");
    }
    if (tok->type == EQ) {
        pop_stack(s_file, "x5");
        pop_stack(s_file, "x6");
        fprintf(s_file, "XOR x5, x5, x6\n");        // same bits -> 0, different bits -> 1
        fprintf(s_file, "SEQZ x5, x5\n");           // x5 = (x5 == 0)
        push_stack(s_file, "x5");
        fprintf(s_file, "\n");
    }
    if (tok->type == GE) {
        pop_stack(s_file, "x5");
        pop_stack(s_file, "x6");
        fprintf(s_file, "SLT x5, x5, x6\n");          // x5 >= x6, !(x5 < x6)
        fprintf(s_file, "XORI x5, x5, 1\n");
        push_stack(s_file, "x5");
        fprintf(s_file, "\n");
    }
    if (tok->type == GT) {
        pop_stack(s_file, "x5");
        pop_stack(s_file, "x6");
        fprintf(s_file, "SLT x5, x6, x5\n");        // x5 > x6, x6 < x5
        push_stack(s_file, "x5");
        fprintf(s_file, "\n");
    }
    if (tok->type == DROP) {
        fprintf(s_file, "ADDI sp, sp, 4\n");  // increment stack pointer
        fprintf(s_file, "\n");
    }
    if (tok->type == DUP) {
        peek_stack(s_file, "x5");   // peek top of stack in x5
        push_stack(s_file, "x5");   // push same x5 value to stack
        fprintf(s_file, "\n");
    }
    if (tok->type == SWAP) {
        pop_stack(s_file, "x5");    // pop top
        pop_stack(s_file, "x6");    // pop second to top
        push_stack(s_file, "x5");   // push top
        push_stack(s_file, "x6");   // push second to top
        fprintf(s_file, "\n");
    }
    if (tok->type == ROT) {
        pop_stack(s_file, "x5");
        pop_stack(s_file, "x6");
        pop_stack(s_file, "x7");
        push_stack(s_file, "x6");
        push_stack(s_file, "x5");
        push_stack(s_file, "x7");
        fprintf(s_file, "\n");
    }
    if (tok->type == SET_ARG) {
        pop_stack(s_file, "x5");                                        // pop top of stack
        fprintf(s_file, "ADDI a%d, x5, 0\n", (tok->arg_no) - 1);        // load into a(N-1)
        fprintf(s_file, "\n");
    }
    if (tok->type == GET_ARG) {
        fprintf(s_file, "ADDI x5, a%d, 0\n", (tok->arg_no) - 1);        // load a(N-1) into x5
        push_stack(s_file, "x5");                                       // push x5 to stack
        fprintf(s_file, "\n");
    }
    if (tok->type == DEFUN) {
        token identoken;
        next_token(j_file, &identoken);
        if (identoken.type != IDENT) {
            fprintf(stderr, "Error: 'DEFUN' must be followed by an identifier (line %d)", identoken.line_number);
            return false;
        }
        
        // PROLOGUE
        fprintf(s_file, "%s:\n", identoken.str);
        fprintf(s_file, "ADDI sp, sp, -16\n");           // make room for new function's stack
        fprintf(s_file, "SW ra, 12(sp)\n");              // store return address
        fprintf(s_file, "SW s0, 8(sp)\n");              // store caller's frame pointer
        fprintf(s_file, "ADDI s0, sp, 16\n");           // update s0 to be new function's frame pointer
        fprintf(s_file, "SW a0, -12(s0)\n");            // save copy of a0
        fprintf(s_file, "SW a1, -16(s0)\n");            // save copy of a1
        fprintf(s_file, "\n");

    }
    if (tok->type == IDENT) {
        fprintf(s_file, "CALL %s\n", tok->str);
        push_stack(s_file, "a0");
        fprintf(s_file, "\n");
    }
    if (tok->type == RETURN) {
        // EPILOGUE
        fprintf(s_file, "LW a0, 0(sp)\n");              // load top of stack into a0
        fprintf(s_file, "ADDI sp, s0, 0\n");            // increment and restore stack pointer
        fprintf(s_file, "LW ra, -4(s0)\n");             // restore return address
        fprintf(s_file, "LW s0, -8(s0)\n");             // restore frame pointer
        fprintf(s_file, "RET\n");
        fprintf(s_file, "\n");
    }
    if (tok->type == IF) {
        uint32_t current_if_count = (*if_counter)++;
        pop_stack(s_file, "x5");
        fprintf(s_file, "BEQ x5, x0, else%d\n", current_if_count);
        fprintf(s_file, "\n");
        token next_tok;
        next_token(j_file, &next_tok);
        while (next_tok.type != ELSE && next_tok.type != ENDIF) {
            handle_token(j_file, s_file, &next_tok, if_counter, while_counter);
            next_token(j_file, &next_tok);
        }
        fprintf(s_file, "j endif%d\n", current_if_count);
        fprintf(s_file, "\n");
        fprintf(s_file, "else%d:\n", current_if_count);
        while (next_tok.type != ENDIF) {
            handle_token(j_file, s_file, &next_tok, if_counter, while_counter);
            next_token(j_file, &next_tok);
        }
        fprintf(s_file, "j endif%d\n", current_if_count);
        fprintf(s_file, "\n");
        fprintf(s_file, "endif%d:\n", current_if_count);
    }
    if (tok->type == WHILE) {
        uint32_t current_while_count = (*while_counter)++;
        fprintf(s_file, "j while%d\n", current_while_count);
        fprintf(s_file, "\n");
        fprintf(s_file, "while%d:\n", current_while_count);
        pop_stack(s_file, "x5");
        fprintf(s_file, "BEQ x5, x0, endwhile%d\n", current_while_count);
        fprintf(s_file, "\n");
        token next_tok;
        next_token(j_file, &next_tok);
        while (next_tok.type != ENDWHILE) {
            handle_token(j_file, s_file, &next_tok, if_counter, while_counter);
            next_token(j_file, &next_tok);
        }
        fprintf(s_file, "j while%d\n", current_while_count);
        fprintf(s_file, "\n");
        fprintf(s_file, "endwhile%d:\n", current_while_count);

    }


    return true;
}
