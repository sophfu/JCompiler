.text
.p2align 2
.globl main

main:
ADDI sp, sp, -16
SW ra, 12(sp)
SW s0, 8(sp)
ADDI s0, sp, 16
SW a0, -12(s0)
SW a1, -16(s0)

ADDI x5, x0, 5
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 3
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
SLT x5, x6, x5

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL print_int
ADDI sp, sp, -4
SW a0, 0(sp)

CALL endl
ADDI sp, sp, -4
SW a0, 0(sp)

ADDI x5, x0, 0
SLLI x5, x5, 11
ADDI x5, x5, 3
SLLI x5, x5, 11
ADDI x5, x5, 856
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, -834
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
SLT x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL print_int
ADDI sp, sp, -4
SW a0, 0(sp)

CALL endl
ADDI sp, sp, -4
SW a0, 0(sp)

LW a0, 0(sp)
ADDI sp, s0, 0
LW ra, -4(s0)
LW s0, -8(s0)
RET

.END: