	.file	"main.cpp"
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
	subq	$48, %rsp
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6StringIcEC1Ev
	leaq	-32(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZNK6StringIcE4readEi
	movb	%al, -34(%rbp)
	leaq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZN6StringIhEC1Ev
	leaq	-16(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	_ZNK6StringIhE4readEi
	movb	%al, -33(%rbp)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.text._ZN6StringIcEC2Ev,"axG",@progbits,_ZN6StringIcEC5Ev,comdat
	.align 2
	.weak	_ZN6StringIcEC2Ev
	.type	_ZN6StringIcEC2Ev, @function
_ZN6StringIcEC2Ev:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movl	$16, %edi
	call	_Znwm
	movq	%rax, %rbx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rbx, %rdi
	call	_ZN6StringIcE4SrepC1EiPKc
	movq	-24(%rbp), %rax
	movq	%rbx, (%rax)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	_ZN6StringIcEC2Ev, .-_ZN6StringIcEC2Ev
	.weak	_ZN6StringIcEC1Ev
	.set	_ZN6StringIcEC1Ev,_ZN6StringIcEC2Ev
	.section	.text._ZNK6StringIcE4readEi,"axG",@progbits,_ZNK6StringIcE4readEi,comdat
	.align 2
	.weak	_ZNK6StringIcE4readEi
	.type	_ZNK6StringIcE4readEi, @function
_ZNK6StringIcE4readEi:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_ZNK6StringIcE4readEi, .-_ZNK6StringIcE4readEi
	.section	.text._ZN6StringIhEC2Ev,"axG",@progbits,_ZN6StringIhEC5Ev,comdat
	.align 2
	.weak	_ZN6StringIhEC2Ev
	.type	_ZN6StringIhEC2Ev, @function
_ZN6StringIhEC2Ev:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movl	$16, %edi
	call	_Znwm
	movq	%rax, %rbx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rbx, %rdi
	call	_ZN6StringIhE4SrepC1EiPKh
	movq	-24(%rbp), %rax
	movq	%rbx, (%rax)
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	_ZN6StringIhEC2Ev, .-_ZN6StringIhEC2Ev
	.weak	_ZN6StringIhEC1Ev
	.set	_ZN6StringIhEC1Ev,_ZN6StringIhEC2Ev
	.section	.text._ZNK6StringIhE4readEi,"axG",@progbits,_ZNK6StringIhE4readEi,comdat
	.align 2
	.weak	_ZNK6StringIhE4readEi
	.type	_ZNK6StringIhE4readEi, @function
_ZNK6StringIhE4readEi:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	_ZNK6StringIhE4readEi, .-_ZNK6StringIhE4readEi
	.section	.text._ZN6StringIcE4SrepC2EiPKc,"axG",@progbits,_ZN6StringIcE4SrepC5EiPKc,comdat
	.align 2
	.weak	_ZN6StringIcE4SrepC2EiPKc
	.type	_ZN6StringIcE4SrepC2EiPKc, @function
_ZN6StringIcE4SrepC2EiPKc:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, 8(%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	_ZN6StringIcE4SrepC2EiPKc, .-_ZN6StringIcE4SrepC2EiPKc
	.weak	_ZN6StringIcE4SrepC1EiPKc
	.set	_ZN6StringIcE4SrepC1EiPKc,_ZN6StringIcE4SrepC2EiPKc
	.section	.text._ZN6StringIhE4SrepC2EiPKh,"axG",@progbits,_ZN6StringIhE4SrepC5EiPKh,comdat
	.align 2
	.weak	_ZN6StringIhE4SrepC2EiPKh
	.type	_ZN6StringIhE4SrepC2EiPKh, @function
_ZN6StringIhE4SrepC2EiPKh:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	$1, 12(%rax)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, 8(%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	_ZN6StringIhE4SrepC2EiPKh, .-_ZN6StringIhE4SrepC2EiPKh
	.weak	_ZN6StringIhE4SrepC1EiPKh
	.set	_ZN6StringIhE4SrepC1EiPKh,_ZN6StringIhE4SrepC2EiPKh
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
