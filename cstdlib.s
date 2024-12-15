	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p0_m2p0"
	.file	"cstdlib.c"
	.globl	memmove
	.p2align	2
	.type	memmove,@function
memmove:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	addi	s0, sp, 48
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	sw	a2, -24(s0)
	lw	a1, -16(s0)
	lw	a0, -20(s0)
	bgeu	a0, a1, .LBB0_2
	j	.LBB0_1
.LBB0_1:
	lw	a0, -16(s0)
	lw	a1, -20(s0)
	lw	a2, -24(s0)
	add	a1, a1, a2
	bltu	a0, a1, .LBB0_3
	j	.LBB0_2
.LBB0_2:
	lw	a0, -16(s0)
	lw	a1, -20(s0)
	lw	a2, -24(s0)
	call	memcpy
	sw	a0, -12(s0)
	j	.LBB0_8
.LBB0_3:
	lw	a0, -20(s0)
	sw	a0, -28(s0)
	lw	a0, -16(s0)
	sw	a0, -32(s0)
	li	a0, 0
	sw	a0, -36(s0)
	j	.LBB0_4
.LBB0_4:
	lw	a0, -36(s0)
	lw	a1, -24(s0)
	bgeu	a0, a1, .LBB0_7
	j	.LBB0_5
.LBB0_5:
	lw	a0, -28(s0)
	lw	a2, -24(s0)
	lw	a1, -36(s0)
	not	a1, a1
	add	a2, a1, a2
	add	a0, a0, a2
	lb	a0, 0(a0)
	lw	a1, -32(s0)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB0_6
.LBB0_6:
	lw	a0, -36(s0)
	addi	a0, a0, 1
	sw	a0, -36(s0)
	j	.LBB0_4
.LBB0_7:
	lw	a0, -16(s0)
	sw	a0, -12(s0)
	j	.LBB0_8
.LBB0_8:
	lw	a0, -12(s0)
	lw	ra, 44(sp)
	lw	s0, 40(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	memmove, .Lfunc_end0-memmove

	.globl	memcpy
	.p2align	2
	.type	memcpy,@function
memcpy:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a0, -16(s0)
	sw	a0, -24(s0)
	lw	a0, -12(s0)
	sw	a0, -28(s0)
	li	a0, 0
	sw	a0, -32(s0)
	j	.LBB1_1
.LBB1_1:
	lw	a0, -32(s0)
	lw	a1, -20(s0)
	bgeu	a0, a1, .LBB1_4
	j	.LBB1_2
.LBB1_2:
	lw	a0, -24(s0)
	lw	a2, -32(s0)
	add	a0, a0, a2
	lb	a0, 0(a0)
	lw	a1, -28(s0)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB1_3
.LBB1_3:
	lw	a0, -32(s0)
	addi	a0, a0, 1
	sw	a0, -32(s0)
	j	.LBB1_1
.LBB1_4:
	lw	a0, -12(s0)
	lw	ra, 28(sp)
	lw	s0, 24(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end1:
	.size	memcpy, .Lfunc_end1-memcpy

	.globl	memset
	.p2align	2
	.type	memset,@function
memset:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	lw	a0, -12(s0)
	sw	a0, -24(s0)
	li	a0, 0
	sw	a0, -28(s0)
	j	.LBB2_1
.LBB2_1:
	lw	a0, -28(s0)
	lw	a1, -20(s0)
	bgeu	a0, a1, .LBB2_4
	j	.LBB2_2
.LBB2_2:
	lw	a0, -16(s0)
	lw	a1, -24(s0)
	lw	a2, -28(s0)
	add	a1, a1, a2
	sb	a0, 0(a1)
	j	.LBB2_3
.LBB2_3:
	lw	a0, -28(s0)
	addi	a0, a0, 1
	sw	a0, -28(s0)
	j	.LBB2_1
.LBB2_4:
	lw	a0, -12(s0)
	lw	ra, 28(sp)
	lw	s0, 24(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end2:
	.size	memset, .Lfunc_end2-memset

	.globl	memcmp
	.p2align	2
	.type	memcmp,@function
memcmp:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	addi	s0, sp, 48
	sw	a0, -16(s0)
	sw	a1, -20(s0)
	sw	a2, -24(s0)
	lw	a0, -16(s0)
	sw	a0, -28(s0)
	lw	a0, -20(s0)
	sw	a0, -32(s0)
	li	a0, 0
	sw	a0, -36(s0)
	j	.LBB3_1
.LBB3_1:
	lw	a0, -36(s0)
	lw	a1, -24(s0)
	bgeu	a0, a1, .LBB3_6
	j	.LBB3_2
.LBB3_2:
	lw	a0, -28(s0)
	lw	a2, -36(s0)
	add	a0, a0, a2
	lbu	a0, 0(a0)
	lw	a1, -32(s0)
	add	a1, a1, a2
	lbu	a1, 0(a1)
	beq	a0, a1, .LBB3_4
	j	.LBB3_3
.LBB3_3:
	lw	a0, -28(s0)
	lw	a2, -36(s0)
	add	a0, a0, a2
	lbu	a0, 0(a0)
	lw	a1, -32(s0)
	add	a1, a1, a2
	lbu	a1, 0(a1)
	sub	a0, a0, a1
	sw	a0, -12(s0)
	j	.LBB3_7
.LBB3_4:
	j	.LBB3_5
.LBB3_5:
	lw	a0, -36(s0)
	addi	a0, a0, 1
	sw	a0, -36(s0)
	j	.LBB3_1
.LBB3_6:
	li	a0, 0
	sw	a0, -12(s0)
	j	.LBB3_7
.LBB3_7:
	lw	a0, -12(s0)
	lw	ra, 44(sp)
	lw	s0, 40(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end3:
	.size	memcmp, .Lfunc_end3-memcmp

	.globl	strlen
	.p2align	2
	.type	strlen,@function
strlen:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sw	a0, -12(s0)
	li	a0, 0
	sw	a0, -16(s0)
	j	.LBB4_1
.LBB4_1:
	lw	a0, -12(s0)
	lbu	a0, 0(a0)
	li	a1, 0
	beq	a0, a1, .LBB4_3
	j	.LBB4_2
.LBB4_2:
	lw	a0, -12(s0)
	addi	a0, a0, 1
	sw	a0, -12(s0)
	lw	a0, -16(s0)
	addi	a0, a0, 1
	sw	a0, -16(s0)
	j	.LBB4_1
.LBB4_3:
	lw	a0, -16(s0)
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end4:
	.size	strlen, .Lfunc_end4-strlen

	.globl	print_int
	.p2align	2
	.type	print_int,@function
print_int:
	addi	sp, sp, -48
	sw	ra, 44(sp)
	sw	s0, 40(sp)
	addi	s0, sp, 48
	sw	a0, -16(s0)
	lw	a0, -16(s0)
	li	a1, 0
	bne	a0, a1, .LBB5_2
	j	.LBB5_1
.LBB5_1:
	li	a0, 48
	call	stdout_putc
	li	a0, 1
	sb	a0, -9(s0)
	j	.LBB5_11
.LBB5_2:
	li	a1, 0
	sw	a1, -32(s0)
	lw	a0, -16(s0)
	srli	a0, a0, 31
	sw	a0, -36(s0)
	lw	a0, -36(s0)
	beq	a0, a1, .LBB5_4
	j	.LBB5_3
.LBB5_3:
	li	a0, 45
	call	stdout_putc
	lw	a1, -16(s0)
	li	a0, 0
	sub	a0, a0, a1
	sw	a0, -16(s0)
	j	.LBB5_4
.LBB5_4:
	j	.LBB5_5
.LBB5_5:
	lw	a1, -16(s0)
	li	a0, 0
	bge	a0, a1, .LBB5_7
	j	.LBB5_6
.LBB5_6:
	lw	a0, -16(s0)
	lui	a1, 419430
	addi	a1, a1, 1639
	mulh	a2, a0, a1
	srli	a3, a2, 31
	srli	a2, a2, 2
	add	a2, a2, a3
	li	a3, 10
	mul	a2, a2, a3
	sub	a0, a0, a2
	addi	a0, a0, 48
	lw	a3, -32(s0)
	addi	a2, a3, 1
	sw	a2, -32(s0)
	addi	a2, s0, -26
	add	a2, a2, a3
	sb	a0, 0(a2)
	lw	a0, -16(s0)
	mulh	a0, a0, a1
	srli	a1, a0, 31
	srai	a0, a0, 2
	add	a0, a0, a1
	sw	a0, -16(s0)
	j	.LBB5_5
.LBB5_7:
	j	.LBB5_8
.LBB5_8:
	lw	a1, -32(s0)
	li	a0, 0
	bge	a0, a1, .LBB5_10
	j	.LBB5_9
.LBB5_9:
	lw	a0, -32(s0)
	addi	a1, a0, -1
	sw	a1, -32(s0)
	addi	a0, s0, -26
	add	a0, a0, a1
	lbu	a0, 0(a0)
	call	stdout_putc
	j	.LBB5_8
.LBB5_10:
	li	a0, 1
	sb	a0, -9(s0)
	j	.LBB5_11
.LBB5_11:
	lbu	a0, -9(s0)
	lw	ra, 44(sp)
	lw	s0, 40(sp)
	addi	sp, sp, 48
	ret
.Lfunc_end5:
	.size	print_int, .Lfunc_end5-print_int

	.globl	stdout_putc
	.p2align	2
	.type	stdout_putc,@function
stdout_putc:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	sb	a0, -9(s0)
	li	a0, 1
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end6:
	.size	stdout_putc, .Lfunc_end6-stdout_putc

	.globl	print_quad
	.p2align	2
	.type	print_quad,@function
print_quad:
	addi	sp, sp, -32
	sw	ra, 28(sp)
	sw	s0, 24(sp)
	addi	s0, sp, 32
	sw	a0, -12(s0)
	sw	a1, -16(s0)
	sw	a2, -20(s0)
	sw	a3, -24(s0)
	lw	a0, -12(s0)
	call	print_int
	call    endl
	lw	a0, -16(s0)
	call	print_int
	call    endl
	lw	a0, -20(s0)
	call	print_int
	call    endl
	lw	a0, -24(s0)
	call	print_int
	call    endl
	li	a0, 1
	lw	ra, 28(sp)
	lw	s0, 24(sp)
	addi	sp, sp, 32
	ret
.Lfunc_end7:
	.size	print_quad, .Lfunc_end7-print_quad

	.globl	endl
	.p2align	2
	.type	endl,@function
endl:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	addi	s0, sp, 16
	li	a0, 10
	call	stdout_putc
	li	a0, 1
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	addi	sp, sp, 16
	ret
.Lfunc_end8:
	.size	endl, .Lfunc_end8-endl

	.type	errno,@object
	.section	.sbss,"aw",@nobits
	.globl	errno
	.p2align	2
errno:
	.word	0
	.size	errno, 4

	.ident	"Ubuntu clang version 15.0.7"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym memcpy
	.addrsig_sym print_int
	.addrsig_sym stdout_putc
