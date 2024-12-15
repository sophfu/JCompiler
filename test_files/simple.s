.text
.p2align 2
.globl main

CALL simple.END÷
ADDI sp, sp, -4
SW a0, 0(sp)

CALL print_int÷
ADDI sp, sp, -4
SW a0, 0(sp)

CALL stdout_putc÷
ADDI sp, sp, -4
SW a0, 0(sp)

CALL print_quad÷
ADDI sp, sp, -4
SW a0, 0(sp)

.END: