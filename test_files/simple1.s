.text
.p2align 2
.simple1

simple1:
ADDI x5, x0, 5
ADDI sp, sp, -4
SW x5, 0(s0)

ADDI x5, x0, 3
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

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
ADD x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(s0)

ADDI x5, x0, 3
ADDI sp, sp, -4
SW x5, 0(s0)

ADDI x5, x0, 4
ADDI sp, sp, -4
SW x5, 0(s0)

ADDI x5, x0, 5
ADDI sp, sp, -4
SW x5, 0(s0)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
MUL x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(s0)

LW x5, 0(sp)
ADDI sp, sp, 4
LW x6, 0(sp)
ADDI sp, sp, 4
ADD x5, x5, x6
ADDI sp, sp, -4
SW x5, 0(s0)

.END: