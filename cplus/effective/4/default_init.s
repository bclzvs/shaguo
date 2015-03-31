	.file	"default_init.cpp"
	.section	.text._ZN3FooC2Ei,"axG",@progbits,_ZN3FooC5Ei,comdat
	.align 2
	.weak	_ZN3FooC2Ei
	.type	_ZN3FooC2Ei, @function
_ZN3FooC2Ei:
.LFB1:
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
	movl	%edx, (%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_ZN3FooC2Ei, .-_ZN3FooC2Ei
	.weak	_ZN3FooC1Ei
	.set	_ZN3FooC1Ei,_ZN3FooC2Ei
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	-16(%rbp), %rax
	movl	$3, %esi
	movq	%rax, %rdi
	call	_ZN3FooC1Ei
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
