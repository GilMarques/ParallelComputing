	.file	"bucketsortradix.c"
	.text
	.p2align 4
	.globl	countSort
	.type	countSort, @function
countSort:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	movslq	%esi, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	salq	$2, %rdi
	subq	$216, %rsp
	.cfi_def_cfa_offset 240
	movq	%fs:40, %rax
	movq	%rax, 200(%rsp)
	xorl	%eax, %eax
	call	malloc@PLT
	movq	%rsp, %rdi
	movl	$25, %ecx
	movq	%rax, %rsi
	xorl	%eax, %eax
	rep stosq
	testl	%ebx, %ebx
	jle	.L10
	leal	-1(%rbx), %eax
	movq	%rbp, %rdx
	leaq	4(%rbp,%rax,4), %r8
	.p2align 4,,10
	.p2align 3
.L3:
	movslq	(%rdx), %rax
	addq	$4, %rdx
	movq	%rax, %rcx
	imulq	$1374389535, %rax, %rax
	movl	%ecx, %edi
	sarl	$31, %edi
	sarq	$36, %rax
	subl	%edi, %eax
	imull	$50, %eax, %edi
	movl	%ecx, %eax
	subl	%edi, %eax
	cltq
	addl	$1, (%rsp,%rax,4)
	cmpq	%rdx, %r8
	jne	.L3
	movl	4(%rsp), %ecx
	movl	(%rsp), %edx
.L2:
	leaq	4(%rsp), %rax
	leaq	200(%rsp), %rdi
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L17:
	movl	(%rax), %ecx
.L5:
	addl	%ecx, %edx
	addq	$4, %rax
	movl	%edx, -4(%rax)
	cmpq	%rax, %rdi
	jne	.L17
	testl	%ebx, %ebx
	jle	.L13
	leal	-1(%rbx), %eax
	movq	%rbp, %rdi
	leaq	4(%rbp,%rax,4), %r9
	.p2align 4,,10
	.p2align 3
.L7:
	movslq	(%rdi), %rax
	addq	$4, %rdi
	movq	%rax, %rcx
	imulq	$1374389535, %rax, %rax
	movl	%ecx, %edx
	sarl	$31, %edx
	sarq	$36, %rax
	subl	%edx, %eax
	imull	$50, %eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	cltq
	movslq	(%rsp,%rax,4), %r8
	movq	%r8, %rdx
	movl	%ecx, -4(%rsi,%r8,4)
	subl	$1, %edx
	movl	%edx, (%rsp,%rax,4)
	cmpq	%r9, %rdi
	jne	.L7
	movl	%ebx, %edx
	salq	$2, %rdx
	movq	200(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L15
	addq	$216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	memcpy@PLT
.L10:
	.cfi_restore_state
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	jmp	.L2
.L13:
	movq	200(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L15
	addq	$216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE51:
	.size	countSort, .-countSort
	.p2align 4
	.globl	bucket_sort
	.type	bucket_sort, @function
bucket_sort:
.LFB50:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%esi, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	movl	$1600, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	malloc@PLT
	movq	%rax, %r12
	movq	%rax, %rbp
	leaq	1600(%rax), %r13
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L19:
	movl	$4000000, %edi
	addq	$16, %rbx
	call	malloc@PLT
	movl	$0, -16(%rbx)
	movq	%rax, -8(%rbx)
	cmpq	%rbx, %r13
	jne	.L19
	testl	%r15d, %r15d
	jle	.L23
	leal	-1(%r15), %eax
	movq	%r14, %rcx
	leaq	4(%r14,%rax,4), %rdi
.L21:
	movslq	(%rcx), %rax
	addq	$4, %rcx
	movq	%rax, %rsi
	imulq	$1374389535, %rax, %rax
	movl	%esi, %edx
	sarl	$31, %edx
	sarq	$36, %rax
	subl	%edx, %eax
	cltq
	salq	$4, %rax
	addq	%r12, %rax
	movslq	(%rax), %rdx
	movq	8(%rax), %r8
	leal	1(%rdx), %r9d
	movl	%esi, (%r8,%rdx,4)
	movl	%r9d, (%rax)
	cmpq	%rcx, %rdi
	jne	.L21
	.p2align 4,,10
	.p2align 3
.L23:
	movl	(%r12), %esi
	cmpl	$1, %esi
	jle	.L22
	movq	8(%r12), %rdi
	call	countSort
.L22:
	addq	$16, %r12
	cmpq	%r13, %r12
	jne	.L23
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L24:
	movl	0(%rbp), %ebx
	testl	%ebx, %ebx
	jle	.L27
	movslq	%r12d, %rax
	movq	8(%rbp), %rsi
	movslq	%ebx, %rdx
	addl	%ebx, %r12d
	leaq	(%r14,%rax,4), %rdi
	salq	$2, %rdx
	call	memcpy@PLT
.L27:
	addq	$16, %rbp
	cmpq	%rbp, %r13
	jne	.L24
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE50:
	.size	bucket_sort, .-bucket_sort
	.p2align 4
	.globl	random_vector
	.type	random_vector, @function
random_vector:
.LFB52:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L37
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leal	-1(%rsi), %eax
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	4(%rdi,%rax,4), %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L34:
	call	rand@PLT
	addq	$4, %rbp
	movl	%eax, %edx
	cltq
	imulq	$1759218605, %rax, %rax
	movl	%edx, %ecx
	sarl	$31, %ecx
	sarq	$43, %rax
	subl	%ecx, %eax
	imull	$5000, %eax, %eax
	subl	%eax, %edx
	movl	%edx, -4(%rbp)
	cmpq	%rbx, %rbp
	jne	.L34
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE52:
	.size	random_vector, .-random_vector
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Yes"
.LC1:
	.string	"No"
	.text
	.p2align 4
	.globl	is_sorted
	.type	is_sorted, @function
is_sorted:
.LFB53:
	.cfi_startproc
	endbr64
	leaq	.LC0(%rip), %rax
	cmpl	$1, %esi
	jle	.L40
	leal	-2(%rsi), %ecx
	movl	(%rdi), %edx
	leaq	4(%rdi), %rax
	leaq	8(%rdi,%rcx,4), %r8
	movl	$1, %ecx
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L43:
	movl	%edx, %esi
	movl	(%rax), %edx
	cmpl	%esi, %edx
	cmovl	%edi, %ecx
	addq	$4, %rax
	cmpq	%r8, %rax
	jne	.L43
	testl	%ecx, %ecx
	leaq	.LC0(%rip), %rax
	leaq	.LC1(%rip), %rdx
	cmove	%rdx, %rax
.L40:
	ret
	.cfi_endproc
.LFE53:
	.size	is_sorted, .-is_sorted
	.section	.rodata.str1.1
.LC2:
	.string	"computation"
.LC3:
	.string	"Done!"
.LC4:
	.string	"Is sorted? %s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB54:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	cmpl	$2, %edi
	je	.L49
.L51:
	movl	$1, %r12d
.L48:
	movl	%r12d, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L49:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movslq	%eax, %rdi
	movq	%rax, %rbx
	salq	$2, %rdi
	call	malloc@PLT
	movl	%ebx, %esi
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	random_vector
	leaq	.LC2(%rip), %rdi
	call	PAPI_hl_region_begin@PLT
	testl	%eax, %eax
	jne	.L51
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	bucket_sort
	leaq	.LC2(%rip), %rdi
	call	PAPI_hl_region_end@PLT
	movl	%eax, %r12d
	testl	%eax, %eax
	jne	.L51
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	is_sorted
	leaq	.LC4(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L48
	.cfi_endproc
.LFE54:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 10.2.0-13ubuntu1) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
