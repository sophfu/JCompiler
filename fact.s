.text
.p2align 2
.globl main

fact:
ADDI sp, sp, -16
SW ra, 12(sp)
SW s0, 8(sp)
ADDI s0, sp, 16
SW a0, -12(s0)
SW a1, -16(s0)

ADDI x5, a0, 0
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 1
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
SLT x5, x5, x6
XORI x5, x5, 1
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
BEQ x5, x0, else0

ADDI x5, x0, 1
ADDI sp, sp, -4
SW x5, 0(sp)

j endif0

else0:
LW x5, 0(sp)
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 1
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
ADDI sp, sp, -4
SW x5, 0(sp)
ADDI sp, sp, -4
SW x6, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
SUB x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL fact
ADDI sp, sp, -4
SW a0, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
ADDI sp, sp, -4
SW x5, 0(sp)
ADDI sp, sp, -4
SW x6, 0(sp)

ADDI sp, sp, 4

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
MUL x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(sp)

j endif0

endif0:
LW a0, 0(sp)
ADDI sp, s0, 0
LW ra, -4(s0)
LW s0, -8(s0)
RET

main:
ADDI sp, sp, -16
SW ra, 12(sp)
SW s0, 8(sp)
ADDI s0, sp, 16
SW a0, -12(s0)
SW a1, -16(s0)

ADDI x5, x0, 4
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL fact
ADDI sp, sp, -4
SW a0, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL print_int
ADDI sp, sp, -4
SW a0, 0(sp)

CALL endl
ADDI sp, sp, -4
SW a0, 0(sp)

ADDI x5, x0, 5
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL fact
ADDI sp, sp, -4
SW a0, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL print_int
ADDI sp, sp, -4
SW a0, 0(sp)

CALL endl
ADDI sp, sp, -4
SW a0, 0(sp)

ADDI x5, x0, 6
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL fact
ADDI sp, sp, -4
SW a0, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL print_int
ADDI sp, sp, -4
SW a0, 0(sp)

CALL endl
ADDI sp, sp, -4
SW a0, 0(sp)

ADDI x5, x0, 7
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL fact
ADDI sp, sp, -4
SW a0, 0(sp)

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