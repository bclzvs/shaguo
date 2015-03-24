	.file	"default_ctor.cpp"
	.section	.text._ZN5EmptyC2Ev,"axG",@progbits,_ZN5EmptyC5Ev,comdat
	.align 2
	.weak	_ZN5EmptyC2Ev
	.type	_ZN5EmptyC2Ev, @function
_ZN5EmptyC2Ev:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_ZN5EmptyC2Ev, .-_ZN5EmptyC2Ev
	.weak	_ZN5EmptyC1Ev
	.set	_ZN5EmptyC1Ev,_ZN5EmptyC2Ev
	.section	.text._ZN5EmptyD2Ev,"axG",@progbits,_ZN5EmptyD5Ev,comdat
	.align 2
	.weak	_ZN5EmptyD2Ev
	.type	_ZN5EmptyD2Ev, @function
_ZN5EmptyD2Ev:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_ZN5EmptyD2Ev, .-_ZN5EmptyD2Ev
	.weak	_ZN5EmptyD1Ev
	.set	_ZN5EmptyD1Ev,_ZN5EmptyD2Ev
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5EmptyC1Ev
	movl	$0, %ebx
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5EmptyD1Ev
	movl	%ebx, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
