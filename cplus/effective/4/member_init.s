	.file	"default_init.cpp"
	.section	.text._ZN3BarC2Ev,"axG",@progbits,_ZN3BarC5Ev,comdat
	.align 2
	.weak	_ZN3BarC2Ev
	.type	_ZN3BarC2Ev, @function
_ZN3BarC2Ev:
.LFB557:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE557:
	.size	_ZN3BarC2Ev, .-_ZN3BarC2Ev
	.weak	_ZN3BarC1Ev
	.set	_ZN3BarC1Ev,_ZN3BarC2Ev
	.section	.text._ZN3FooC2Ei3Bar,"axG",@progbits,_ZN3FooC5Ei3Bar,comdat
	.align 2
	.weak	_ZN3FooC2Ei3Bar
	.type	_ZN3FooC2Ei3Bar, @function
_ZN3FooC2Ei3Bar:
.LFB560:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	-16(%rbp), %edx
	movl	%edx, 4(%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE560:
	.size	_ZN3FooC2Ei3Bar, .-_ZN3FooC2Ei3Bar
	.weak	_ZN3FooC1Ei3Bar
	.set	_ZN3FooC1Ei3Bar,_ZN3FooC2Ei3Bar
	.text
	.globl	main
	.type	main, @function
main:
.LFB562:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN3BarC1Ev
	movl	-32(%rbp), %edx
	leaq	-16(%rbp), %rax
	movl	$3, %esi
	movq	%rax, %rdi
	call	_ZN3FooC1Ei3Bar
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE562:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
