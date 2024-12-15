#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
#include <stdint.h>

#include "token.h"

int line_number;

bool next_token(FILE *j_file, token *output) {

    char buffer[MAX_TOKEN_LENGTH + 1] = {0};
    int c;
    size_t index = 0;

    // skip whitespace and comments
    while ((c = fgetc(j_file)) != EOF) {
        if (c == ';') {
            while ((c = fgetc(j_file)) != EOF && c != '\n');
        }
        if (!isspace(c)) break;
        if (c == '\n') {
            line_number++;
        }
    }
    if (c == EOF) return false;

    buffer[index++] = (char)c;
    while ((c = fgetc(j_file)) != EOF && !isspace(c) && c != ';') {
        if (index < MAX_TOKEN_LENGTH) {
            buffer[index++] = (char)c;
        }
    }
    if (c == ';') { 
        while ((c = fgetc(j_file)) != EOF && c != '\n');
    }
    if (c == '\n') {
        line_number++;
    }
    buffer[index] = '\0';

    strcpy(output->str, buffer);
    output->type = BAD_TOKEN;

    if (isalpha(buffer[0])) {
        output->type = IDENT;
    }

    if (strncmp(buffer, "0x", 2) == 0 || strncmp(buffer, "0X", 2) == 0) {
        char *endptr;
        output->type = LITERAL;
        output->literal_value = (int32_t)strtol(buffer, &endptr, 16);
        if (*endptr == '\0') return true;
        output->type = BAD_TOKEN;
    }

    if (isdigit(buffer[0]) || (buffer[0] == '-' && isdigit(buffer[1]))) {
        char *endptr;
        output->type = LITERAL;
        output->literal_value = (int32_t)strtol(buffer, &endptr, 10);
        if (*endptr == '\0') return true;
        output->type = BAD_TOKEN;
    }

    // map strings to token types
    if (strcmp(buffer, "defun") == 0) output->type = DEFUN;
    if (strcmp(buffer, "return") == 0) output->type = RETURN;
    if (strcmp(buffer, "+") == 0) output->type = PLUS;
    if (strcmp(buffer, "-") == 0) output->type = MINUS;
    if (strcmp(buffer, "*") == 0) output->type = MUL;
    if (strcmp(buffer, "/") == 0) output->type = DIV;
    if (strcmp(buffer, "%") == 0) output->type = MOD;
    if (strcmp(buffer, "and") == 0) output->type = AND;
    if (strcmp(buffer, "or") == 0) output->type = OR;
    if (strcmp(buffer, "not") == 0) output->type = NOT;
    if (strcmp(buffer, "lt") == 0) output->type = LT;
    if (strcmp(buffer, "le") == 0) output->type = LE;
    if (strcmp(buffer, "eq") == 0) output->type = EQ;
    if (strcmp(buffer, "ge") == 0) output->type = GE;
    if (strcmp(buffer, "gt") == 0) output->type = GT;
    if (strcmp(buffer, "if") == 0) output->type = IF;
    if (strcmp(buffer, "else") == 0) output->type = ELSE;
    if (strcmp(buffer, "endif") == 0) output->type = ENDIF;
    if (strcmp(buffer, "while") == 0) output->type = WHILE;
    if (strcmp(buffer, "endwhile") == 0) output->type = ENDWHILE;
    if (strcmp(buffer, "drop") == 0) output->type = DROP;
    if (strcmp(buffer, "dup") == 0) output->type = DUP;
    if (strcmp(buffer, "swap") == 0) output->type = SWAP;
    if (strcmp(buffer, "rot") == 0) output->type = ROT;
    if (strncmp(buffer, "get_arg", 7) == 0) {
        output->type = GET_ARG;
        output->arg_no = atoi(buffer + 7);
    }
    if (strncmp(buffer, "set_arg", 7) == 0) {
        output->type = SET_ARG;
        output->arg_no = atoi(buffer + 7);
    }

    if (output->type == BAD_TOKEN) {
        fprintf(stderr, "Error: Bad token found (line %d)\n", line_number);
    }

    output->line_number = line_number;

    return true;
}

void print_token (FILE* f, token to_print) {
    switch (to_print.type) {
        case DEFUN:
            fprintf(f, "(%d) Token Type: DEFUN, Token String: %s\n", to_print.line_number,to_print.str);
            break;
        case IDENT:
            fprintf(f, "(%d) Token Type: IDENT, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case RETURN:
            fprintf(f, "(%d) Token Type: RETURN, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case PLUS:
            fprintf(f, "(%d) Token Type: PLUS, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case MINUS:
            fprintf(f, "(%d) Token Type: MINUS, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case MUL:
            fprintf(f, "(%d) Token Type: MUL, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case DIV:
            fprintf(f, "(%d) Token Type: DIV, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case MOD:
            fprintf(f, "(%d) Token Type: MOD, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case AND:
            fprintf(f, "(%d) Token Type: AND, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case OR:
            fprintf(f, "(%d) Token Type: OR, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case NOT:
            fprintf(f, "(%d) Token Type: NOT, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case LT:
            fprintf(f, "(%d) Token Type: LT, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case LE:
            fprintf(f, "(%d) Token Type: LE, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case EQ:
            fprintf(f, "(%d) Token Type: EQ, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case GE:
            fprintf(f, "(%d) Token Type: GE, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case GT:
            fprintf(f, "(%d) Token Type: GT, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case IF:
            fprintf(f, "(%d) Token Type: IF, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case ELSE:
            fprintf(f, "(%d) Token Type: ELSE, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case ENDIF:
            fprintf(f, "(%d) Token Type: ENDIF, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case WHILE:
            fprintf(f, "(%d) Token Type: WHILE, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case ENDWHILE:
            fprintf(f, "(%d) Token Type: ENDWHILE, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case DROP:
            fprintf(f, "(%d) Token Type: DROP, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case DUP:
            fprintf(f, "(%d) Token Type: DUP, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case SWAP:
            fprintf(f, "(%d) Token Type: SWAP, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case ROT:
            fprintf(f, "(%d) Token Type: ROT, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        case GET_ARG:
            fprintf(f, "(%d) Token Type: GET_ARG, Arg Number: %d, Token String: %s\n", to_print.line_number, to_print.arg_no, to_print.str);
            break;
        case SET_ARG:
            fprintf(f, "(%d) Token Type: SET_ARG, Arg Number: %d, Token String: %s\n", to_print.line_number, to_print.arg_no, to_print.str);
            break;
        case LITERAL:
            fprintf(f, "(%d) Token Type: LITERAL, Literal Value: %d, Token String: %s\n", to_print.line_number, to_print.literal_value, to_print.str);
            break;
        case BAD_TOKEN:
            fprintf(f, "(%d) Token Type: BAD_TOKEN, Token String: %s\n", to_print.line_number, to_print.str);
            break;
        default:
            fprintf(f, "(%d) Token Type: UNKNOWN, Token String: %s\n", to_print.line_number, to_print.str);
            break;
    }
}