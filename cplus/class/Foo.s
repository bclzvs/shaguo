	.file	"Foo.cpp"
	.text
	.align 2
	.globl	_ZN3FooC2Ev
	.type	_ZN3FooC2Ev, @function
_ZN3FooC2Ev:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$123, (%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_ZN3FooC2Ev, .-_ZN3FooC2Ev
	.globl	_ZN3FooC1Ev
	.set	_ZN3FooC1Ev,_ZN3FooC2Ev
	.align 2
	.globl	_ZN3FooC2ERS_
	.type	_ZN3FooC2ERS_, @function
_ZN3FooC2ERS_:
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
	.size	_ZN3FooC2ERS_, .-_ZN3FooC2ERS_
	.globl	_ZN3FooC1ERS_
	.set	_ZN3FooC1ERS_,_ZN3FooC2ERS_
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
