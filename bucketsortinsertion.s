	.file	"bucketsortinsertion.c"
	.text
	.p2align 4
	.globl	insertionSort
	.type	insertionSort, @function
insertionSort:
.LFB51:
	.cfi_startproc
	endbr64
	movq	%rdi, %r11
	cmpl	$1, %esi
	jle	.L1
	leaq	4(%rdi), %r8
	leal	-1(%rsi), %r10d
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L6:
	leaq	0(,%r9,4), %rax
	leaq	-4(%r8), %rsi
	movl	(%r8), %edi
	subq	%rax, %rsi
	movq	%r8, %rax
	.p2align 4,,10
	.p2align 3
.L3:
	movl	-4(%rax), %edx
	movq	%rax, %rcx
	cmpl	%edi, %edx
	jle	.L4
	movl	%edx, (%rax)
	leaq	-4(%rcx), %rax
	cmpq	%rax, %rsi
	jne	.L3
	movq	%r11, %rcx
.L4:
	addq	$1, %r9
	movl	%edi, (%rcx)
	addq	$4, %r8
	cmpq	%r10, %r9
	jne	.L6
.L1:
	ret
	.cfi_endproc
.LFE51:
	.size	insertionSort, .-insertionSort
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
	movl	$3200, %edi
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
	leaq	3200(%rax), %r13
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L12:
	movl	$4000, %edi
	addq	$16, %rbx
	call	malloc@PLT
	movl	$0, -16(%rbx)
	movq	%rax, -8(%rbx)
	cmpq	%rbx, %r13
	jne	.L12
	testl	%r15d, %r15d
	jle	.L16
	leal	-1(%r15), %eax
	movq	%r14, %rcx
	leaq	4(%r14,%rax,4), %rdi
.L14:
	movslq	(%rcx), %rax
	addq	$4, %rcx
	movq	%rax, %rsi
	imulq	$274877907, %rax, %rax
	movl	%esi, %edx
	sarl	$31, %edx
	sarq	$38, %rax
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
	jne	.L14
	.p2align 4,,10
	.p2align 3
.L16:
	movl	(%r12), %esi
	cmpl	$1, %esi
	jle	.L15
	movq	8(%r12), %rdi
	call	insertionSort
.L15:
	addq	$16, %r12
	cmpq	%r13, %r12
	jne	.L16
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L17:
	movl	0(%rbp), %ebx
	testl	%ebx, %ebx
	jle	.L20
	movslq	%r12d, %rax
	movq	8(%rbp), %rsi
	movslq	%ebx, %rdx
	addl	%ebx, %r12d
	leaq	(%r14,%rax,4), %rdi
	salq	$2, %rdx
	call	memcpy@PLT
.L20:
	addq	$16, %rbp
	cmpq	%rbp, %r13
	jne	.L17
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
	jle	.L30
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
.L27:
	call	rand@PLT
	addq	$4, %rbp
	movl	%eax, %edx
	cltq
	imulq	$351843721, %rax, %rax
	movl	%edx, %ecx
	sarl	$31, %ecx
	sarq	$46, %rax
	subl	%ecx, %eax
	imull	$200000, %eax, %eax
	subl	%eax, %edx
	movl	%edx, -4(%rbp)
	cmpq	%rbx, %rbp
	jne	.L27
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L30:
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
	jle	.L33
	leal	-2(%rsi), %ecx
	movl	(%rdi), %edx
	leaq	4(%rdi), %rax
	leaq	8(%rdi,%rcx,4), %r8
	movl	$1, %ecx
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L36:
	movl	%edx, %esi
	movl	(%rax), %edx
	cmpl	%esi, %edx
	cmovl	%edi, %ecx
	addq	$4, %rax
	cmpq	%r8, %rax
	jne	.L36
	testl	%ecx, %ecx
	leaq	.LC0(%rip), %rax
	leaq	.LC1(%rip), %rdx
	cmove	%rdx, %rax
.L33:
	ret
	.cfi_endproc
.LFE53:
	.size	is_sorted, .-is_sorted
	.section	.rodata.str1.1
.LC2:
	.string	"computation"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB54:
	.cfi_startproc
	endbr64
	cmpl	$2, %edi
	je	.L42
	movl	$1, %eax
	ret
.L42:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	$10, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	pushq	%rcx
	.cfi_def_cfa_offset 32
	movq	8(%rsi), %rdi
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
	je	.L48
	movl	$1, %eax
.L41:
	popq	%rdx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L48:
	.cfi_restore_state
	movl	%ebx, %esi
	movq	%rbp, %rdi
	call	bucket_sort
	leaq	.LC2(%rip), %rdi
	call	PAPI_hl_region_end@PLT
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L41
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
