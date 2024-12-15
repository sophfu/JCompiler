.text
.p2align 2
.globl main

ADDI x5, x0, 5
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 5
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
XOR x5, x5, x6
SEQZ x5, x5
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL print_int
ADDI sp, sp, -4
SW a0, 0(sp)

.END: