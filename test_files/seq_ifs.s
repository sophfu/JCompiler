.text
.p2align 2
.globl main

double:
ADDI sp, sp, -16
SW ra, 12(sp)
SW s0, 8(sp)
ADDI s0, sp, 16
SW a0, -12(s0)
SW a1, -16(s0)

ADDI x5, a0, 0
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 2
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
MUL x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(sp)

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

ADDI x5, x0, 200
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL double
ADDI sp, sp, -4
SW a0, 0(sp)

ADDI x5, x0, 405
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
BEQ x5, x0, else0

ADDI x5, x0, 0
SLLI x5, x5, 11
ADDI x5, x5, 15
SLLI x5, x5, 11
ADDI x5, x5, 1024
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 100
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 100
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 50
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 10
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a1, x5, 0

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a2, x5, 0

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a3, x5, 0

CALL print_quad
ADDI sp, sp, -4
SW a0, 0(sp)

ADDI sp, sp, 4

CALL endl
ADDI sp, sp, -4
SW a0, 0(sp)

ADDI sp, sp, 4

j endif0

else0:
ADDI x5, x0, 0
SLLI x5, x5, 11
ADDI x5, x5, 6
SLLI x5, x5, 11
ADDI x5, x5, 768
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 20
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 100
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 100
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 14
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a1, x5, 0

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a2, x5, 0

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a3, x5, 0

CALL print_quad
ADDI sp, sp, -4
SW a0, 0(sp)

CALL endl
ADDI sp, sp, -4
SW a0, 0(sp)

ADDI sp, sp, 4

ADDI sp, sp, 4

j endif0

endif0:
ADDI x5, x0, 300
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

CALL double
ADDI sp, sp, -4
SW a0, 0(sp)

ADDI x5, x0, 405
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
SLT x5, x6, x5
XORI x5, x5, 1
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
BEQ x5, x0, else1

ADDI x5, x0, 0
SLLI x5, x5, 11
ADDI x5, x5, 15
SLLI x5, x5, 11
ADDI x5, x5, 1024
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 30
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 20
ADDI sp, sp, -4
SW x5, 0(sp)

ADDI x5, x0, 10
ADDI sp, sp, -4
SW x5, 0(sp)

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a0, x5, 0

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a1, x5, 0

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a2, x5, 0

LW x5, 0(sp)
ADDI sp, sp, 4
ADDI a3, x5, 0

CALL print_quad
ADDI sp, sp, -4
SW a0, 0(sp)

ADDI sp, sp, 4

CALL endl
ADDI sp, sp, -4
SW a0, 0(sp)

ADDI sp, sp, 4

j endif1

else1:
j endif1

endif1:
LW a0, 0(sp)
ADDI sp, s0, 0
LW ra, -4(s0)
LW s0, -8(s0)
RET

.END: