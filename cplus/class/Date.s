	.file	"Date.cpp"
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.text
	.align 2
	.globl	_ZN4DateC2Eiii
	.type	_ZN4DateC2Eiii, @function
_ZN4DateC2Eiii:
.LFB972:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	-16(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	-8(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 8(%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE972:
	.size	_ZN4DateC2Eiii, .-_ZN4DateC2Eiii
	.globl	_ZN4DateC1Eiii
	.set	_ZN4DateC1Eiii,_ZN4DateC2Eiii
	.align 2
	.globl	_ZN4Date7add_dayEi
	.type	_ZN4Date7add_dayEi, @function
_ZN4Date7add_dayEi:
.LFB974:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movl	-12(%rbp), %eax
	addl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE974:
	.size	_ZN4Date7add_dayEi, .-_ZN4Date7add_dayEi
	.align 2
	.globl	_ZN4Date9add_monthEi
	.type	_ZN4Date9add_monthEi, @function
_ZN4Date9add_monthEi:
.LFB975:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	4(%rax), %edx
	movl	-12(%rbp), %eax
	addl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 4(%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE975:
	.size	_ZN4Date9add_monthEi, .-_ZN4Date9add_monthEi
	.align 2
	.globl	_ZN4Date8add_yearEi
	.type	_ZN4Date8add_yearEi, @function
_ZN4Date8add_yearEi:
.LFB976:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	-8(%rbp), %rax
	movl	8(%rax), %edx
	movl	-12(%rbp), %eax
	addl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, 8(%rax)
	movq	-8(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE976:
	.size	_ZN4Date8add_yearEi, .-_ZN4Date8add_yearEi
	.section	.rodata
.LC0:
	.string	"%d-%d-%d"
	.text
	.align 2
	.globl	_ZN4Date6to_strEv
	.type	_ZN4Date6to_strEv, @function
_ZN4Date6to_strEv:
.LFB977:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$11, %eax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %esi
	movq	-24(%rbp), %rax
	movl	4(%rax), %ecx
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%esi, %r9d
	movl	%ecx, %r8d
	movl	%edx, %ecx
	movl	$.LC0, %edx
	movl	$11, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	snprintf
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE977:
	.size	_ZN4Date6to_strEv, .-_ZN4Date6to_strEv
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB978:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L10
	cmpl	$65535, -8(%rbp)
	jne	.L10
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	call	__cxa_atexit
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE978:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I__ZN4DateC2Eiii, @function
_GLOBAL__sub_I__ZN4DateC2Eiii:
.LFB979:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE979:
	.size	_GLOBAL__sub_I__ZN4DateC2Eiii, .-_GLOBAL__sub_I__ZN4DateC2Eiii
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__ZN4DateC2Eiii
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
