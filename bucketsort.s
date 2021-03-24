	.file	"bucketsort.c"
	.text
	.p2align 4
	.type	bubble.part.0, @function
bubble.part.0:
.LFB56:
	.cfi_startproc
	leal	-1(%rsi), %r10d
	movq	%rdi, %r9
	testl	%r10d, %r10d
	jle	.L1
	leal	-2(%rsi), %eax
	xorl	%r8d, %r8d
	leaq	4(%rdi,%rax,4), %rsi
	.p2align 4,,10
	.p2align 3
.L5:
	movq	%r9, %rax
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L4:
	movl	4(%rax), %ecx
	movl	(%rax), %edx
	cmpl	%edx, %ecx
	jge	.L3
	movl	%ecx, (%rax)
	movl	$1, %edi
	movl	%edx, 4(%rax)
.L3:
	addq	$4, %rax
	cmpq	%rsi, %rax
	jne	.L4
	testl	%edi, %edi
	je	.L1
	addl	$1, %r8d
	cmpl	%r10d, %r8d
	jne	.L5
.L1:
	ret
	.cfi_endproc
.LFE56:
	.size	bubble.part.0, .-bubble.part.0
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
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movl	%esi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movl	$160, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	malloc@PLT
	movq	%rax, %rbp
	leaq	8(%rax), %r14
	movq	%rax, %r12
	leaq	168(%rax), %r15
	.p2align 4,,10
	.p2align 3
.L13:
	movl	$4000000, %edi
	addq	$16, %r14
	call	malloc@PLT
	movq	%rax, -16(%r14)
	cmpq	%r14, %r15
	jne	.L13
	leaq	160(%rbp), %r11
	movq	%rbp, %rax
	.p2align 4,,10
	.p2align 3
.L14:
	movl	$0, (%rax)
	addq	$16, %rax
	cmpq	%rax, %r11
	jne	.L14
	testl	%r13d, %r13d
	jle	.L18
	leal	-1(%r13), %eax
	movq	%rbx, %rcx
	leaq	4(%rbx,%rax,4), %rdi
	.p2align 4,,10
	.p2align 3
.L16:
	movslq	(%rcx), %rax
	addq	$4, %rcx
	movq	%rax, %rsi
	imulq	$1717986919, %rax, %rax
	movl	%esi, %edx
	sarl	$31, %edx
	sarq	$34, %rax
	subl	%edx, %eax
	cltq
	salq	$4, %rax
	addq	%rbp, %rax
	movslq	(%rax), %rdx
	movq	8(%rax), %r8
	leal	1(%rdx), %r9d
	movl	%esi, (%r8,%rdx,4)
	movl	%r9d, (%rax)
	cmpq	%rdi, %rcx
	jne	.L16
	.p2align 4,,10
	.p2align 3
.L18:
	movl	0(%rbp), %esi
	cmpl	$1, %esi
	jle	.L17
	movq	8(%rbp), %rdi
	call	bubble.part.0
.L17:
	addq	$16, %rbp
	cmpq	%r11, %rbp
	jne	.L18
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L19:
	movl	(%r12), %r8d
	testl	%r8d, %r8d
	jle	.L23
	movslq	%r9d, %rax
	movq	8(%r12), %rdi
	movslq	%r8d, %rsi
	leaq	(%rbx,%rax,4), %rcx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L20:
	movl	(%rdi,%rax,4), %edx
	movl	%edx, (%rcx,%rax,4)
	addq	$1, %rax
	cmpq	%rax, %rsi
	jne	.L20
	addl	%r8d, %r9d
.L23:
	addq	$16, %r12
	cmpq	%r11, %r12
	jne	.L19
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
	.globl	bubble
	.type	bubble, @function
bubble:
.LFB51:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	je	.L30
	jmp	bubble.part.0
	.p2align 4,,10
	.p2align 3
.L30:
	ret
	.cfi_endproc
.LFE51:
	.size	bubble, .-bubble
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d "
	.text
	.p2align 4
	.globl	print_array
	.type	print_array, @function
print_array:
.LFB52:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L37
	leal	-1(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	4(%rdi,%rax,4), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	.LC0(%rip), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	.p2align 4,,10
	.p2align 3
.L34:
	movl	(%rbx), %edx
	movq	%rbp, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$4, %rbx
	call	__printf_chk@PLT
	cmpq	%r12, %rbx
	jne	.L34
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 24
	movl	$10, %edi
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 8
	jmp	putchar@PLT
	.p2align 4,,10
	.p2align 3
.L37:
	movl	$10, %edi
	jmp	putchar@PLT
	.cfi_endproc
.LFE52:
	.size	print_array, .-print_array
	.p2align 4
	.globl	random_vector
	.type	random_vector, @function
random_vector:
.LFB53:
	.cfi_startproc
	endbr64
	testl	%esi, %esi
	jle	.L45
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
.L42:
	call	rand@PLT
	addq	$4, %rbp
	movl	%eax, %edx
	cltq
	imulq	$1374389535, %rax, %rax
	movl	%edx, %ecx
	sarl	$31, %ecx
	sarq	$37, %rax
	subl	%ecx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %edx
	movl	%edx, -4(%rbp)
	cmpq	%rbx, %rbp
	jne	.L42
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE53:
	.size	random_vector, .-random_vector
	.section	.rodata.str1.1
.LC1:
	.string	"Yes"
.LC2:
	.string	"No"
	.text
	.p2align 4
	.globl	is_sorted
	.type	is_sorted, @function
is_sorted:
.LFB54:
	.cfi_startproc
	endbr64
	leaq	.LC1(%rip), %rax
	cmpl	$1, %esi
	jle	.L48
	leal	-2(%rsi), %ecx
	movl	(%rdi), %edx
	leaq	4(%rdi), %rax
	leaq	8(%rdi,%rcx,4), %r8
	movl	$1, %ecx
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L51:
	movl	%edx, %esi
	movl	(%rax), %edx
	cmpl	%esi, %edx
	cmovl	%edi, %ecx
	addq	$4, %rax
	cmpq	%r8, %rax
	jne	.L51
	testl	%ecx, %ecx
	leaq	.LC1(%rip), %rax
	leaq	.LC2(%rip), %rdx
	cmove	%rdx, %rax
.L48:
	ret
	.cfi_endproc
.LFE54:
	.size	is_sorted, .-is_sorted
	.section	.rodata.str1.1
.LC3:
	.string	"computation"
.LC4:
	.string	"Error Begin"
.LC5:
	.string	"Error End"
.LC6:
	.string	"Done!"
.LC7:
	.string	"Is sorted? %s\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB55:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movl	$200000, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	malloc@PLT
	movl	$50000, %esi
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	random_vector
	leaq	.LC3(%rip), %rdi
	call	PAPI_hl_region_begin@PLT
	testl	%eax, %eax
	jne	.L61
	movl	$50000, %esi
	movq	%rbp, %rdi
	call	bucket_sort
	leaq	.LC3(%rip), %rdi
	call	PAPI_hl_region_end@PLT
	movl	%eax, %r12d
	testl	%eax, %eax
	jne	.L62
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$50000, %esi
	movq	%rbp, %rdi
	call	is_sorted
	leaq	.LC7(%rip), %rsi
	movl	$1, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L56:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%r12d, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L62:
	.cfi_restore_state
	leaq	.LC5(%rip), %rdi
	movl	$1, %r12d
	call	puts@PLT
	jmp	.L56
.L61:
	leaq	.LC4(%rip), %rdi
	movl	$1, %r12d
	call	puts@PLT
	jmp	.L56
	.cfi_endproc
.LFE55:
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
