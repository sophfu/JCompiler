#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "token.h"
#include "compiler.h"

int main(int argc, char *argv[]) {

    if (argc < 2 || argc > 4) {
        fprintf(stderr, "Usage: %s source.j\n", argv[0]);
        return EXIT_FAILURE;
    }

    char *j_filename = argv[1];
    if (argc == 3) {
        j_filename = argv[2];
    }

    FILE *j_file = fopen(j_filename, "r");
    if (!j_file) {
        fprintf(stderr, "Error: Could not open file '%s'\n", j_filename);
        return EXIT_FAILURE;
    }

    // char *program_name = (char*)malloc(strlen(j_filename) - 1);     // source.j -> source \0
    char *s_filename = (char*)malloc(strlen(j_filename) + 1);
    // strncpy(program_name, j_filename, strlen(j_filename) - 2);
    // program_name[strlen(j_filename) - 2] = '\0';

    strncpy(s_filename, j_filename, strlen(j_filename) - 2);
    s_filename[strlen(j_filename) - 2] = '\0';
    strcat(s_filename, ".s");

    // char *s_filename = "source.s";
    char *program_name = "main";

    FILE *s_file = fopen(s_filename, "w");
    if (!s_file) {
        fprintf(stderr, "Error: Could not create file '%s'\n", s_filename);
        free(s_filename);
        // free(program_name);
        fclose(j_file);
        return EXIT_FAILURE;
    }
    free(s_filename);

    token current_token;
    printf("Reading tokens from '%s':\n", j_filename);
    
    line_number = 1;

    fprintf(s_file, ".text\n.p2align 2\n.globl %s\n\n", program_name);
    // fprintf(s_file, "%s:\n", program_name);
    // free(program_name);

    uint32_t if_counter = 0;
    uint32_t while_counter = 0;

    while (next_token(j_file, &current_token)) {
        if (!handle_token(j_file, s_file, &current_token, &if_counter, &while_counter)) {
            fclose(j_file);
            return EXIT_FAILURE;
        }
    }

    fprintf(s_file, ".END:");

    fclose(j_file);
    return EXIT_SUCCESS;
}