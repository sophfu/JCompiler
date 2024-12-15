.text
.p2align 2
.globl only_arith

only_arith:
ADDI x5, x0, 6
ADDI sp, sp, -4
SW x5, 0(s0)

ADDI x5, x0, 3
ADDI sp, sp, -4
SW x5, 0(s0)

ADDI x5, x0, 7
ADDI sp, sp, -4
SW x5, 0(s0)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
ADD x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(s0)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
SUB x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(s0)

ADDI x5, x0, 13
ADDI sp, sp, -4
SW x5, 0(s0)

ADDI x5, x0, 64
ADDI sp, sp, -4
SW x5, 0(s0)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
REM x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(s0)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
DIV x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(s0)

ADDI x5, x0, 2
ADDI sp, sp, -4
SW x5, 0(s0)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
MUL x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(s0)

.END: