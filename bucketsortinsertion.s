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
	jle	.L10
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
.L10:
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
	movl	$32000, %edi
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
	leaq	32000(%rax), %r13
	movq	%rax, %rbx
	.p2align 4,,10
	.p2align 3
.L13:
	movl	$4000, %edi
	addq	$16, %rbx
	call	malloc@PLT
	movl	$0, -16(%rbx)
	movq	%rax, -8(%rbx)
	cmpq	%rbx, %r13
	jne	.L13
	testl	%r15d, %r15d
	jle	.L17
	leal	-1(%r15), %eax
	movq	%r14, %rcx
	leaq	4(%r14,%rax,4), %rdi
.L15:
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
	addq	%r12, %rax
	movslq	(%rax), %rdx
	movq	8(%rax), %r8
	leal	1(%rdx), %r9d
	movl	%esi, (%r8,%rdx,4)
	movl	%r9d, (%rax)
	cmpq	%rcx, %rdi
	jne	.L15
	.p2align 4,,10
	.p2align 3
.L17:
	movl	(%r12), %esi
	cmpl	$1, %esi
	jle	.L16
	movq	8(%r12), %rdi
	call	insertionSort
.L16:
	addq	$16, %r12
	cmpq	%r13, %r12
	jne	.L17
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L18:
	movl	0(%rbp), %ebx
	testl	%ebx, %ebx
	jle	.L21
	movslq	%r12d, %rax
	movq	8(%rbp), %rsi
	movslq	%ebx, %rdx
	addl	%ebx, %r12d
	leaq	(%r14,%rax,4), %rdi
	salq	$2, %rdx
	call	memcpy@PLT
.L21:
	addq	$16, %rbp
	cmpq	%rbp, %r13
	jne	.L18
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
	jle	.L33
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
.L29:
	call	rand@PLT
	addq	$4, %rbp
	movl	%eax, %edx
	cltq
	imulq	$1759218605, %rax, %rax
	movl	%edx, %ecx
	sarl	$31, %ecx
	sarq	$45, %rax
	subl	%ecx, %eax
	imull	$20000, %eax, %eax
	subl	%eax, %edx
	movl	%edx, -4(%rbp)
	cmpq	%rbx, %rbp
	jne	.L29
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L33:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE52:
	.size	random_vector, .-random_vector
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Yes"
.LC2:
	.string	"No"
	.text
	.p2align 4
	.globl	is_sorted
	.type	is_sorted, @function
is_sorted:
.LFB53:
	.cfi_startproc
	endbr64
	leal	-1(%rsi), %ecx
	leaq	.LC1(%rip), %rax
	testl	%ecx, %ecx
	jle	.L36
	subl	$2, %esi
	cmpl	$6, %esi
	jbe	.L46
	movl	%ecx, %edx
	vmovdqa	.LC0(%rip), %ymm3
	movq	%rdi, %rax
	shrl	$3, %edx
	salq	$5, %rdx
	addq	%rdi, %rdx
	.p2align 4,,10
	.p2align 3
.L39:
	vmovdqu	(%rax), %xmm4
	vmovdqu	4(%rax), %xmm5
	addq	$32, %rax
	vinserti128	$0x1, -16(%rax), %ymm4, %ymm1
	vinserti128	$0x1, -12(%rax), %ymm5, %ymm2
	vpcmpgtd	%ymm2, %ymm1, %ymm1
	vpandn	%ymm3, %ymm1, %ymm3
	cmpq	%rax, %rdx
	jne	.L39
	vextracti128	$0x1, %ymm3, %xmm0
	movl	%ecx, %r8d
	vpminsd	%xmm3, %xmm0, %xmm0
	andl	$-8, %r8d
	vpsrldq	$8, %xmm0, %xmm1
	movl	%r8d, %eax
	vpminsd	%xmm1, %xmm0, %xmm0
	vpsrldq	$4, %xmm0, %xmm1
	vpminsd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %edx
	cmpl	%r8d, %ecx
	je	.L51
	vzeroupper
.L38:
	movl	%ecx, %r9d
	subl	%r8d, %esi
	subl	%r8d, %r9d
	cmpl	$2, %esi
	jbe	.L41
	movl	%r8d, %esi
	vmovd	%edx, %xmm6
	vmovdqu	(%rdi,%rsi,4), %xmm1
	leal	1(%r8), %esi
	vpshufd	$0, %xmm6, %xmm0
	vpcmpgtd	(%rdi,%rsi,4), %xmm1, %xmm1
	movl	%r9d, %esi
	andl	$-4, %esi
	addl	%esi, %eax
	vpandn	%xmm0, %xmm1, %xmm0
	vpsrldq	$8, %xmm0, %xmm1
	vpminsd	%xmm1, %xmm0, %xmm0
	vpsrldq	$4, %xmm0, %xmm1
	vpminsd	%xmm1, %xmm0, %xmm0
	vmovd	%xmm0, %edx
	cmpl	%esi, %r9d
	je	.L40
.L41:
	cltq
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L44:
	movl	4(%rdi,%rax,4), %r10d
	cmpl	%r10d, (%rdi,%rax,4)
	cmovg	%esi, %edx
	addq	$1, %rax
	cmpl	%eax, %ecx
	jg	.L44
.L40:
	testl	%edx, %edx
	leaq	.LC1(%rip), %rax
	leaq	.LC2(%rip), %rdx
	cmove	%rdx, %rax
.L36:
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	vzeroupper
	jmp	.L40
.L46:
	xorl	%r8d, %r8d
	xorl	%eax, %eax
	movl	$1, %edx
	jmp	.L38
	.cfi_endproc
.LFE53:
	.size	is_sorted, .-is_sorted
	.section	.rodata.str1.1
.LC3:
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
	je	.L53
	movl	$1, %eax
	ret
.L53:
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rcx
	.cfi_def_cfa_offset 32
	movq	8(%rsi), %rdi
	call	atoi@PLT
	movslq	%eax, %rdi
	movq	%rdi, %rbp
	salq	$2, %rdi
	call	malloc@PLT
	movl	%ebp, %esi
	movq	%rax, %rdi
	movq	%rax, %r12
	call	random_vector
	leaq	.LC3(%rip), %rdi
	call	PAPI_hl_region_begin@PLT
	testl	%eax, %eax
	je	.L59
	movl	$1, %eax
.L52:
	popq	%rdx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L59:
	.cfi_restore_state
	movl	%ebp, %esi
	movq	%r12, %rdi
	call	bucket_sort
	leaq	.LC3(%rip), %rdi
	call	PAPI_hl_region_end@PLT
	testl	%eax, %eax
	setne	%al
	movzbl	%al, %eax
	jmp	.L52
	.cfi_endproc
.LFE54:
	.size	main, .-main
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
	.long	1
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
