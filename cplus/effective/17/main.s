	.file	"main.cpp"
	.section	.text._ZNKSt9type_infoeqERKS_,"axG",@progbits,_ZNKSt9type_infoeqERKS_,comdat
	.align 2
	.weak	_ZNKSt9type_infoeqERKS_
	.type	_ZNKSt9type_infoeqERKS_, @function
_ZNKSt9type_infoeqERKS_:
.LFB264:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, %rdx
	je	.L2
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movzbl	(%rax), %eax
	cmpb	$42, %al
	je	.L3
	movq	-16(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L3
.L2:
	movl	$1, %eax
	jmp	.L4
.L3:
	movl	$0, %eax
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE264:
	.size	_ZNKSt9type_infoeqERKS_, .-_ZNKSt9type_infoeqERKS_
	.text
	.type	_ZL18__gthread_active_pv, @function
_ZL18__gthread_active_pv:
.LFB298:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$_ZL28__gthrw___pthread_key_createPjPFvPvE, %eax
	testq	%rax, %rax
	setne	%al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE298:
	.size	_ZL18__gthread_active_pv, .-_ZL18__gthread_active_pv
	.type	_ZN9__gnu_cxxL18__exchange_and_addEPVii, @function
_ZN9__gnu_cxxL18__exchange_and_addEPVii:
.LFB327:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	lock xaddl	%edx, (%rax)
	movl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE327:
	.size	_ZN9__gnu_cxxL18__exchange_and_addEPVii, .-_ZN9__gnu_cxxL18__exchange_and_addEPVii
	.type	_ZN9__gnu_cxxL25__exchange_and_add_singleEPii, @function
_ZN9__gnu_cxxL25__exchange_and_add_singleEPii:
.LFB329:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	movl	-28(%rbp), %eax
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE329:
	.size	_ZN9__gnu_cxxL25__exchange_and_add_singleEPii, .-_ZN9__gnu_cxxL25__exchange_and_add_singleEPii
	.type	_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii, @function
_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii:
.LFB331:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	call	_ZL18__gthread_active_pv
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L13
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxxL18__exchange_and_addEPVii
	jmp	.L14
.L13:
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxxL25__exchange_and_add_singleEPii
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE331:
	.size	_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii, .-_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii
	.globl	_Z3barv
	.type	_Z3barv, @function
_Z3barv:
.LFB593:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$2, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE593:
	.size	_Z3barv, .-_Z3barv
	.globl	_Z4funcNSt3tr110shared_ptrI3FooEEi
	.type	_Z4funcNSt3tr110shared_ptrI3FooEEi, @function
_Z4funcNSt3tr110shared_ptrI3FooEEi:
.LFB594:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE594:
	.size	_Z4funcNSt3tr110shared_ptrI3FooEEi, .-_Z4funcNSt3tr110shared_ptrI3FooEEi
	.section	.text._ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EED2Ev,"axG",@progbits,_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EED5Ev,comdat
	.align 2
	.weak	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EED2Ev
	.type	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EED2Ev, @function
_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EED2Ev:
.LFB598:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EED1Ev
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE598:
	.size	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EED2Ev, .-_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EED2Ev
	.weak	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EED1Ev
	.set	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EED1Ev,_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EED2Ev
	.section	.text._ZNSt3tr110shared_ptrI3FooED2Ev,"axG",@progbits,_ZNSt3tr110shared_ptrI3FooED5Ev,comdat
	.align 2
	.weak	_ZNSt3tr110shared_ptrI3FooED2Ev
	.type	_ZNSt3tr110shared_ptrI3FooED2Ev, @function
_ZNSt3tr110shared_ptrI3FooED2Ev:
.LFB600:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EED2Ev
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE600:
	.size	_ZNSt3tr110shared_ptrI3FooED2Ev, .-_ZNSt3tr110shared_ptrI3FooED2Ev
	.weak	_ZNSt3tr110shared_ptrI3FooED1Ev
	.set	_ZNSt3tr110shared_ptrI3FooED1Ev,_ZNSt3tr110shared_ptrI3FooED2Ev
	.text
	.globl	main
	.type	main, @function
main:
.LFB595:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	call	_Z3barv
	movl	%eax, %ebx
	movl	$1, %edi
	call	_Znwm
	movq	%rax, %rdx
	leaq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt3tr110shared_ptrI3FooEC1IS1_EEPT_
	leaq	-32(%rbp), %rax
	movl	%ebx, %esi
	movq	%rax, %rdi
	call	_Z4funcNSt3tr110shared_ptrI3FooEEi
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt3tr110shared_ptrI3FooED1Ev
	movl	$0, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE595:
	.size	main, .-main
	.section	.text._ZNSt3tr110shared_ptrI3FooEC2IS1_EEPT_,"axG",@progbits,_ZNSt3tr110shared_ptrI3FooEC5IS1_EEPT_,comdat
	.align 2
	.weak	_ZNSt3tr110shared_ptrI3FooEC2IS1_EEPT_
	.type	_ZNSt3tr110shared_ptrI3FooEC2IS1_EEPT_, @function
_ZNSt3tr110shared_ptrI3FooEC2IS1_EEPT_:
.LFB609:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EEC2IS1_EEPT_
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE609:
	.size	_ZNSt3tr110shared_ptrI3FooEC2IS1_EEPT_, .-_ZNSt3tr110shared_ptrI3FooEC2IS1_EEPT_
	.weak	_ZNSt3tr110shared_ptrI3FooEC1IS1_EEPT_
	.set	_ZNSt3tr110shared_ptrI3FooEC1IS1_EEPT_,_ZNSt3tr110shared_ptrI3FooEC2IS1_EEPT_
	.section	.text._ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev,"axG",@progbits,_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EED5Ev,comdat
	.align 2
	.weak	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev
	.type	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev, @function
_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev:
.LFB612:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L25
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv
.L25:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE612:
	.size	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev, .-_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev
	.weak	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EED1Ev
	.set	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EED1Ev,_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EED2Ev
	.section	.text._ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EEC2IS1_EEPT_,"axG",@progbits,_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EEC5IS1_EEPT_,comdat
	.align 2
	.weak	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EEC2IS1_EEPT_
	.type	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EEC2IS1_EEPT_, @function
_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EEC2IS1_EEPT_:
.LFB618:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1IP3FooEET_
	movq	-8(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	-16(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	_ZNSt3tr132__enable_shared_from_this_helperILN9__gnu_cxx12_Lock_policyE2EEEvRKNS_14__shared_countIXT_EEEz
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE618:
	.size	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EEC2IS1_EEPT_, .-_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EEC2IS1_EEPT_
	.weak	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EEC1IS1_EEPT_
	.set	_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EEC1IS1_EEPT_,_ZNSt3tr112__shared_ptrI3FooLN9__gnu_cxx12_Lock_policyE2EEC2IS1_EEPT_
	.section	.text._ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv,"axG",@progbits,_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv,comdat
	.align 2
	.weak	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv
	.type	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv, @function
_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv:
.LFB620:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii
	cmpl	$1, %eax
	sete	%al
	testb	%al, %al
	je	.L28
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rdi
	call	*%rax
	movq	-8(%rbp), %rax
	addq	$12, %rax
	movl	$-1, %esi
	movq	%rax, %rdi
	call	_ZN9__gnu_cxxL27__exchange_and_add_dispatchEPii
	cmpl	$1, %eax
	sete	%al
	testb	%al, %al
	je	.L28
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rdi
	call	*%rax
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE620:
	.size	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv, .-_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_releaseEv
	.section	.text._ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP3FooEET_,"axG",@progbits,_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC5IP3FooEET_,comdat
	.align 2
	.weak	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP3FooEET_
	.type	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP3FooEET_, @function
_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP3FooEET_:
.LFB623:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA623
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	$0, (%rax)
	movl	%edx, %r12d
	movl	$32, %edi
.LEHB0:
	call	_Znwm
.LEHE0:
	movq	%rax, %rbx
	movq	-48(%rbp), %rax
	movb	%r12b, (%rsp)
	movq	%rax, %rsi
	movq	%rbx, %rdi
.LEHB1:
	call	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEC1ES2_S4_
.LEHE1:
	movq	-40(%rbp), %rax
	movq	%rbx, (%rax)
	jmp	.L37
.L34:
	movq	%rax, %r12
	movq	%rbx, %rdi
	call	_ZdlPv
	movq	%r12, %rax
	jmp	.L32
.L36:
	movq	%rax, %rbx
	call	__cxa_end_catch
	movq	%rbx, %rax
	movq	%rax, %rdi
.LEHB2:
	call	_Unwind_Resume
.LEHE2:
.L35:
.L32:
	movq	%rax, %rdi
	call	__cxa_begin_catch
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdlPv
.LEHB3:
	call	__cxa_rethrow
.LEHE3:
.L37:
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE623:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP3FooEET_,"aG",@progbits,_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC5IP3FooEET_,comdat
	.align 4
.LLSDA623:
	.byte	0xff
	.byte	0x3
	.uleb128 .LLSDATT623-.LLSDATTD623
.LLSDATTD623:
	.byte	0x1
	.uleb128 .LLSDACSE623-.LLSDACSB623
.LLSDACSB623:
	.uleb128 .LEHB0-.LFB623
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L35-.LFB623
	.uleb128 0x1
	.uleb128 .LEHB1-.LFB623
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L34-.LFB623
	.uleb128 0x3
	.uleb128 .LEHB2-.LFB623
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB623
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L36-.LFB623
	.uleb128 0
.LLSDACSE623:
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x7d
	.align 4
	.long	0

.LLSDATT623:
	.section	.text._ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP3FooEET_,"axG",@progbits,_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC5IP3FooEET_,comdat
	.size	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP3FooEET_, .-_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP3FooEET_
	.weak	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1IP3FooEET_
	.set	_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC1IP3FooEET_,_ZNSt3tr114__shared_countILN9__gnu_cxx12_Lock_policyE2EEC2IP3FooEET_
	.section	.text._ZNSt3tr132__enable_shared_from_this_helperILN9__gnu_cxx12_Lock_policyE2EEEvRKNS_14__shared_countIXT_EEEz,"axG",@progbits,_ZNSt3tr132__enable_shared_from_this_helperILN9__gnu_cxx12_Lock_policyE2EEEvRKNS_14__shared_countIXT_EEEz,comdat
	.weak	_ZNSt3tr132__enable_shared_from_this_helperILN9__gnu_cxx12_Lock_policyE2EEEvRKNS_14__shared_countIXT_EEEz
	.type	_ZNSt3tr132__enable_shared_from_this_helperILN9__gnu_cxx12_Lock_policyE2EEEvRKNS_14__shared_countIXT_EEEz, @function
_ZNSt3tr132__enable_shared_from_this_helperILN9__gnu_cxx12_Lock_policyE2EEEvRKNS_14__shared_countIXT_EEEz:
.LFB625:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rsi, -168(%rbp)
	movq	%rdx, -160(%rbp)
	movq	%rcx, -152(%rbp)
	movq	%r8, -144(%rbp)
	movq	%r9, -136(%rbp)
	testb	%al, %al
	je	.L39
	movaps	%xmm0, -128(%rbp)
	movaps	%xmm1, -112(%rbp)
	movaps	%xmm2, -96(%rbp)
	movaps	%xmm3, -80(%rbp)
	movaps	%xmm4, -64(%rbp)
	movaps	%xmm5, -48(%rbp)
	movaps	%xmm6, -32(%rbp)
	movaps	%xmm7, -16(%rbp)
.L39:
	movq	%rdi, -184(%rbp)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE625:
	.size	_ZNSt3tr132__enable_shared_from_this_helperILN9__gnu_cxx12_Lock_policyE2EEEvRKNS_14__shared_countIXT_EEEz, .-_ZNSt3tr132__enable_shared_from_this_helperILN9__gnu_cxx12_Lock_policyE2EEEvRKNS_14__shared_countIXT_EEEz
	.section	.text._ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv,"axG",@progbits,_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv,comdat
	.align 2
	.weak	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.type	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv, @function
_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv:
.LFB626:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L40
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, %rdi
	call	*%rax
.L40:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE626:
	.size	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv, .-_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.section	.text._ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEC2ES2_S4_,"axG",@progbits,_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEC5ES2_S4_,comdat
	.align 2
	.weak	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEC2ES2_S4_
	.type	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEC2ES2_S4_, @function
_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEC2ES2_S4_:
.LFB628:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev
	movq	-8(%rbp), %rax
	movq	$_ZTVNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE+16, (%rax)
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE628:
	.size	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEC2ES2_S4_, .-_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEC2ES2_S4_
	.weak	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEC1ES2_S4_
	.set	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEC1ES2_S4_,_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEC2ES2_S4_
	.section	.text._ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev,"axG",@progbits,_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED5Ev,comdat
	.align 2
	.weak	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
	.type	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev, @function
_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev:
.LFB631:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$_ZTVNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE+16, (%rax)
	movl	$0, %eax
	testl	%eax, %eax
	je	.L43
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdlPv
.L43:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE631:
	.size	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev, .-_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
	.weak	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED1Ev
	.set	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED1Ev,_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
	.section	.text._ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED0Ev,"axG",@progbits,_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED0Ev,comdat
	.align 2
	.weak	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED0Ev
	.type	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED0Ev, @function
_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED0Ev:
.LFB633:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED1Ev
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdlPv
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE633:
	.size	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED0Ev, .-_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED0Ev
	.section	.text._ZNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev,"axG",@progbits,_ZNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEC5Ev,comdat
	.align 2
	.weak	_ZNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev
	.type	_ZNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev, @function
_ZNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev:
.LFB636:
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
.LFE636:
	.size	_ZNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev, .-_ZNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev
	.weak	_ZNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEC1Ev
	.set	_ZNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEC1Ev,_ZNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev
	.section	.text._ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev,"axG",@progbits,_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC5Ev,comdat
	.align 2
	.weak	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev
	.type	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev, @function
_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev:
.LFB638:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev
	movq	-8(%rbp), %rax
	movq	$_ZTVNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE+16, (%rax)
	movq	-8(%rbp), %rax
	movl	$1, 8(%rax)
	movq	-8(%rbp), %rax
	movl	$1, 12(%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE638:
	.size	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev, .-_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev
	.weak	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC1Ev
	.set	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC1Ev,_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEC2Ev
	.weak	_ZTVNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE
	.section	.rodata._ZTVNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE,"aG",@progbits,_ZTVNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE,comdat
	.align 32
	.type	_ZTVNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE, @object
	.size	_ZTVNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE, 56
_ZTVNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE:
	.quad	0
	.quad	_ZTINSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE
	.quad	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED1Ev
	.quad	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED0Ev
	.quad	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv
	.quad	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.quad	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
	.section	.text._ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED2Ev,"axG",@progbits,_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED5Ev,comdat
	.align 2
	.weak	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED2Ev
	.type	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED2Ev, @function
_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED2Ev:
.LFB641:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	$_ZTVNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE+16, (%rax)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED2Ev
	movl	$0, %eax
	testl	%eax, %eax
	je	.L50
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdlPv
.L50:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE641:
	.size	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED2Ev, .-_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED2Ev
	.weak	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED1Ev
	.set	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED1Ev,_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED2Ev
	.section	.text._ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED0Ev,"axG",@progbits,_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED0Ev,comdat
	.align 2
	.weak	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED0Ev
	.type	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED0Ev, @function
_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED0Ev:
.LFB643:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED1Ev
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdlPv
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE643:
	.size	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED0Ev, .-_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EED0Ev
	.weak	_ZTVNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE
	.section	.rodata._ZTVNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE,"aG",@progbits,_ZTVNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE,comdat
	.align 32
	.type	_ZTVNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE, @object
	.size	_ZTVNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE, 56
_ZTVNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE:
	.quad	0
	.quad	_ZTINSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE
	.quad	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED1Ev
	.quad	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EED0Ev
	.quad	__cxa_pure_virtual
	.quad	_ZNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EE10_M_destroyEv
	.quad	__cxa_pure_virtual
	.weak	_ZTSNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE
	.section	.rodata._ZTSNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE,"aG",@progbits,_ZTSNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE,comdat
	.align 32
	.type	_ZTSNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE, @object
	.size	_ZTSNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE, 90
_ZTSNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE:
	.string	"NSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE"
	.weak	_ZTINSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE
	.section	.rodata._ZTINSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE,"aG",@progbits,_ZTINSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE,comdat
	.align 16
	.type	_ZTINSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE, @object
	.size	_ZTINSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE, 24
_ZTINSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EEE
	.quad	_ZTINSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE
	.weak	_ZTSNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE
	.section	.rodata._ZTSNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE,"aG",@progbits,_ZTSNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE,comdat
	.align 32
	.type	_ZTSNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE, @object
	.size	_ZTSNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE, 58
_ZTSNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE:
	.string	"NSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE"
	.weak	_ZTINSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE
	.section	.rodata._ZTINSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE,"aG",@progbits,_ZTINSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE,comdat
	.align 16
	.type	_ZTINSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE, @object
	.size	_ZTINSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE, 24
_ZTINSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSNSt3tr116_Sp_counted_baseILN9__gnu_cxx12_Lock_policyE2EEE
	.quad	_ZTINSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE
	.section	.rodata
	.align 4
	.type	_ZN9__gnu_cxxL21__default_lock_policyE, @object
	.size	_ZN9__gnu_cxxL21__default_lock_policyE, 4
_ZN9__gnu_cxxL21__default_lock_policyE:
	.long	2
	.section	.text._ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv,"axG",@progbits,_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv,comdat
	.align 2
	.weak	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv
	.type	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv, @function
_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv:
.LFB664:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	addq	$24, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	_ZNKSt3tr111_Sp_deleterI3FooEclEPS1_
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE664:
	.size	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv, .-_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE10_M_disposeEv
	.section	.text._ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info,"axG",@progbits,_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info,comdat
	.align 2
	.weak	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
	.type	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info, @function
_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info:
.LFB665:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	$_ZTINSt3tr111_Sp_deleterI3FooEE, %esi
	movq	%rax, %rdi
	call	_ZNKSt9type_infoeqERKS_
	testb	%al, %al
	je	.L57
	movq	-8(%rbp), %rax
	addq	$24, %rax
	jmp	.L58
.L57:
	movl	$0, %eax
.L58:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE665:
	.size	_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info, .-_ZNSt3tr121_Sp_counted_base_implIP3FooNS_11_Sp_deleterIS1_EELN9__gnu_cxx12_Lock_policyE2EE14_M_get_deleterERKSt9type_info
	.section	.text._ZNKSt3tr111_Sp_deleterI3FooEclEPS1_,"axG",@progbits,_ZNKSt3tr111_Sp_deleterI3FooEclEPS1_,comdat
	.align 2
	.weak	_ZNKSt3tr111_Sp_deleterI3FooEclEPS1_
	.type	_ZNKSt3tr111_Sp_deleterI3FooEclEPS1_, @function
_ZNKSt3tr111_Sp_deleterI3FooEclEPS1_:
.LFB666:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_ZdlPv
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE666:
	.size	_ZNKSt3tr111_Sp_deleterI3FooEclEPS1_, .-_ZNKSt3tr111_Sp_deleterI3FooEclEPS1_
	.weak	_ZTSNSt3tr111_Sp_deleterI3FooEE
	.section	.rodata._ZTSNSt3tr111_Sp_deleterI3FooEE,"aG",@progbits,_ZTSNSt3tr111_Sp_deleterI3FooEE,comdat
	.align 16
	.type	_ZTSNSt3tr111_Sp_deleterI3FooEE, @object
	.size	_ZTSNSt3tr111_Sp_deleterI3FooEE, 28
_ZTSNSt3tr111_Sp_deleterI3FooEE:
	.string	"NSt3tr111_Sp_deleterI3FooEE"
	.weak	_ZTINSt3tr111_Sp_deleterI3FooEE
	.section	.rodata._ZTINSt3tr111_Sp_deleterI3FooEE,"aG",@progbits,_ZTINSt3tr111_Sp_deleterI3FooEE,comdat
	.align 16
	.type	_ZTINSt3tr111_Sp_deleterI3FooEE, @object
	.size	_ZTINSt3tr111_Sp_deleterI3FooEE, 16
_ZTINSt3tr111_Sp_deleterI3FooEE:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSNSt3tr111_Sp_deleterI3FooEE
	.weak	_ZTSNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE
	.section	.rodata._ZTSNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE,"aG",@progbits,_ZTSNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE,comdat
	.align 32
	.type	_ZTSNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE, @object
	.size	_ZTSNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE, 53
_ZTSNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE:
	.string	"NSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE"
	.weak	_ZTINSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE
	.section	.rodata._ZTINSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE,"aG",@progbits,_ZTINSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE,comdat
	.align 16
	.type	_ZTINSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE, @object
	.size	_ZTINSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE, 16
_ZTINSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSNSt3tr111_Mutex_baseILN9__gnu_cxx12_Lock_policyE2EEE
	.section	.rodata
	.align 8
	.type	_ZZL18__gthread_active_pvE20__gthread_active_ptr, @object
	.size	_ZZL18__gthread_active_pvE20__gthread_active_ptr, 8
_ZZL18__gthread_active_pvE20__gthread_active_ptr:
	.quad	_ZL28__gthrw___pthread_key_createPjPFvPvE
	.weakref	_ZL28__gthrw___pthread_key_createPjPFvPvE,__pthread_key_create
	.ident	"GCC: (Ubuntu 4.8.2-19ubuntu1) 4.8.2"
	.section	.note.GNU-stack,"",@progbits
