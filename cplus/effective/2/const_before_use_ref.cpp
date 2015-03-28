	.file	"const.cpp"
	.section	.text._ZNK10GamePlayer5scoreEi,"axG",@progbits,_ZNK10GamePlayer5scoreEi,comdat
	.align 2
	.weak	_ZNK10GamePlayer5scoreEi
	.type	_ZNK10GamePlayer5scoreEi, @function
_ZNK10GamePlayer5scoreEi:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_ZNK10GamePlayer5scoreEi, .-_ZNK10GamePlayer5scoreEi
	.section	.rodata
.LC0:
	.string	"%d\n"
.LC2:
	.string	"AspecRatio %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	-16(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZNK10GamePlayer5scoreEi
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movabsq	$4610123269356690342, %rax
	movq	%rax, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movl	$.LC2, %edi
	movl	$1, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	_ZL10AspecRatio, @object
	.size	_ZL10AspecRatio, 8
_ZL10AspecRatio:
	.long	549755814
	.long	1073377968
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
