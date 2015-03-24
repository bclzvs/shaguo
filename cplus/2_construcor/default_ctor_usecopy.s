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
	.section	.text._ZN5EmptyC2ERKS_,"axG",@progbits,_ZN5EmptyC5ERKS_,comdat
	.align 2
	.weak	_ZN5EmptyC2ERKS_
	.type	_ZN5EmptyC2ERKS_, @function
_ZN5EmptyC2ERKS_:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_ZN5EmptyC2ERKS_, .-_ZN5EmptyC2ERKS_
	.weak	_ZN5EmptyC1ERKS_
	.set	_ZN5EmptyC1ERKS_,_ZN5EmptyC2ERKS_
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
	.section	.text._ZN5EmptyaSERKS_,"axG",@progbits,_ZN5EmptyaSERKS_,comdat
	.align 2
	.weak	_ZN5EmptyaSERKS_
	.type	_ZN5EmptyaSERKS_, @function
_ZN5EmptyaSERKS_:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	_ZN5EmptyaSERKS_, .-_ZN5EmptyaSERKS_
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
	leaq	-18(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5EmptyC1Ev
	leaq	-18(%rbp), %rdx
	leaq	-17(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5EmptyC1ERKS_
	leaq	-18(%rbp), %rdx
	leaq	-17(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZN5EmptyaSERKS_
	movl	$0, %ebx
	leaq	-17(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN5EmptyD1Ev
	leaq	-18(%rbp), %rax
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
