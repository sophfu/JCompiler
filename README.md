# J Compiler

This project is a compiler for a stack-based programming language named **J**. The compiler converts J source code into assembly code, specifically targeting the RISC-V architecture. The compiler reads a J source file, tokenizes it, and then generates corresponding assembly code, which can be assembled and executed.

## Files

### `jc.c`
The main compiler file. It reads the J source code from an input file, tokenizes it, and outputs the generated assembly code to a `.s` file. The flow of the program includes:
1. Reading the source file.
2. Generating assembly code for each token in the source file.
3. Writing the generated assembly code to an output file.

### `token.c`
This file defines the logic for reading and tokenizing the J source code. It processes the source file line by line, identifying keywords, literals, operators, and other components of the J language. Each token is stored and passed to the compiler for code generation.

Key functions:
- `next_token(FILE *j_file, token *output)`: Reads the next token from the input file and stores it in the `token` structure.
- `print_token(FILE* f, token to_print)`: Prints a detailed description of the token for debugging purposes.

### `compiler.c`
This file contains the functions for generating assembly code. It defines operations for manipulating the stack, including pushing, popping, and peeking values on the stack. The assembly code is generated using RISC-V instructions.

Key functions:
- `push_stack(FILE *s_file, char* register_name)`: Generates assembly code to push a value onto the stack.
- `pop_stack(FILE *s_file, char* register_name)`: Generates assembly code to pop a value from the stack into a register.
- `peek_stack(FILE *s_file, char* register_name)`: Generates assembly code to peek the top value of the stack without modifying it.

## Usage

To compile a J program, run the `jc` compiler with the following syntax:

```bash
$ gcc jc.c token.c compiler.c -o jc
$ ./jc <source.j> [output.s]
