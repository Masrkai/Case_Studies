	.file	"vector_test.cpp"
# GNU C++17 (GCC) version 14.3.0 (x86_64-unknown-linux-gnu)
#	compiled by GNU C version 14.3.0, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.20-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mno-omit-leaf-frame-pointer -mtune=generic -march=x86-64 -O0 -fno-omit-frame-pointer
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.globl	_Z15add_arrays_goodPKfS0_Pfi
	.type	_Z15add_arrays_goodPKfS0_Pfi, @function
_Z15add_arrays_goodPKfS0_Pfi:
.LFB2008:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# a, a
	movq	%rsi, -32(%rbp)	# b, b
	movq	%rdx, -40(%rbp)	# c, c
	movl	%ecx, -44(%rbp)	# n, n
# vector_test.cpp:7:     for (int i = 0; i < n; i++) {
	movl	$0, -4(%rbp)	#, i
# vector_test.cpp:7:     for (int i = 0; i < n; i++) {
	jmp	.L2	#
.L3:
# vector_test.cpp:8:         c[i] = a[i] + b[i];
	movl	-4(%rbp), %eax	# i, tmp110
	cltq
# vector_test.cpp:8:         c[i] = a[i] + b[i];
	leaq	0(,%rax,4), %rdx	#, _2
	movq	-24(%rbp), %rax	# a, tmp111
	addq	%rdx, %rax	# _2, _3
	movss	(%rax), %xmm1	# *_3, _4
# vector_test.cpp:8:         c[i] = a[i] + b[i];
	movl	-4(%rbp), %eax	# i, tmp112
	cltq
# vector_test.cpp:8:         c[i] = a[i] + b[i];
	leaq	0(,%rax,4), %rdx	#, _6
	movq	-32(%rbp), %rax	# b, tmp113
	addq	%rdx, %rax	# _6, _7
	movss	(%rax), %xmm0	# *_7, _8
# vector_test.cpp:8:         c[i] = a[i] + b[i];
	movl	-4(%rbp), %eax	# i, tmp114
	cltq
# vector_test.cpp:8:         c[i] = a[i] + b[i];
	leaq	0(,%rax,4), %rdx	#, _10
	movq	-40(%rbp), %rax	# c, tmp115
	addq	%rdx, %rax	# _10, _11
# vector_test.cpp:8:         c[i] = a[i] + b[i];
	addss	%xmm1, %xmm0	# _4, _12
# vector_test.cpp:8:         c[i] = a[i] + b[i];
	movss	%xmm0, (%rax)	# _12, *_11
# vector_test.cpp:7:     for (int i = 0; i < n; i++) {
	addl	$1, -4(%rbp)	#, i
.L2:
# vector_test.cpp:7:     for (int i = 0; i < n; i++) {
	movl	-4(%rbp), %eax	# i, tmp116
	cmpl	-44(%rbp), %eax	# n, tmp116
	jl	.L3	#,
# vector_test.cpp:10: }
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2008:
	.size	_Z15add_arrays_goodPKfS0_Pfi, .-_Z15add_arrays_goodPKfS0_Pfi
	.globl	_Z14add_arrays_badPKfS0_Pfi
	.type	_Z14add_arrays_badPKfS0_Pfi, @function
_Z14add_arrays_badPKfS0_Pfi:
.LFB2009:
	.cfi_startproc
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# a, a
	movq	%rsi, -32(%rbp)	# b, b
	movq	%rdx, -40(%rbp)	# c, c
	movl	%ecx, -44(%rbp)	# n, n
# vector_test.cpp:14:     for (int i = 0; i < n; i++) {
	movl	$0, -4(%rbp)	#, i
# vector_test.cpp:14:     for (int i = 0; i < n; i++) {
	jmp	.L5	#
.L8:
# vector_test.cpp:15:         if (i % 2 == 0) {  // Conditional branch
	movl	-4(%rbp), %eax	# i, i.0_1
	andl	$1, %eax	#, _2
# vector_test.cpp:15:         if (i % 2 == 0) {  // Conditional branch
	testl	%eax, %eax	# _2
	jne	.L6	#,
# vector_test.cpp:16:             c[i] = a[i] + b[i];
	movl	-4(%rbp), %eax	# i, tmp124
	cltq
# vector_test.cpp:16:             c[i] = a[i] + b[i];
	leaq	0(,%rax,4), %rdx	#, _4
	movq	-24(%rbp), %rax	# a, tmp125
	addq	%rdx, %rax	# _4, _5
	movss	(%rax), %xmm1	# *_5, _6
# vector_test.cpp:16:             c[i] = a[i] + b[i];
	movl	-4(%rbp), %eax	# i, tmp126
	cltq
# vector_test.cpp:16:             c[i] = a[i] + b[i];
	leaq	0(,%rax,4), %rdx	#, _8
	movq	-32(%rbp), %rax	# b, tmp127
	addq	%rdx, %rax	# _8, _9
	movss	(%rax), %xmm0	# *_9, _10
# vector_test.cpp:16:             c[i] = a[i] + b[i];
	movl	-4(%rbp), %eax	# i, tmp128
	cltq
# vector_test.cpp:16:             c[i] = a[i] + b[i];
	leaq	0(,%rax,4), %rdx	#, _12
	movq	-40(%rbp), %rax	# c, tmp129
	addq	%rdx, %rax	# _12, _13
# vector_test.cpp:16:             c[i] = a[i] + b[i];
	addss	%xmm1, %xmm0	# _6, _14
# vector_test.cpp:16:             c[i] = a[i] + b[i];
	movss	%xmm0, (%rax)	# _14, *_13
	jmp	.L7	#
.L6:
# vector_test.cpp:18:             c[i] = a[i] * b[i];  // Different operation
	movl	-4(%rbp), %eax	# i, tmp130
	cltq
# vector_test.cpp:18:             c[i] = a[i] * b[i];  // Different operation
	leaq	0(,%rax,4), %rdx	#, _16
	movq	-24(%rbp), %rax	# a, tmp131
	addq	%rdx, %rax	# _16, _17
	movss	(%rax), %xmm1	# *_17, _18
# vector_test.cpp:18:             c[i] = a[i] * b[i];  // Different operation
	movl	-4(%rbp), %eax	# i, tmp132
	cltq
# vector_test.cpp:18:             c[i] = a[i] * b[i];  // Different operation
	leaq	0(,%rax,4), %rdx	#, _20
	movq	-32(%rbp), %rax	# b, tmp133
	addq	%rdx, %rax	# _20, _21
	movss	(%rax), %xmm0	# *_21, _22
# vector_test.cpp:18:             c[i] = a[i] * b[i];  // Different operation
	movl	-4(%rbp), %eax	# i, tmp134
	cltq
# vector_test.cpp:18:             c[i] = a[i] * b[i];  // Different operation
	leaq	0(,%rax,4), %rdx	#, _24
	movq	-40(%rbp), %rax	# c, tmp135
	addq	%rdx, %rax	# _24, _25
# vector_test.cpp:18:             c[i] = a[i] * b[i];  // Different operation
	mulss	%xmm1, %xmm0	# _18, _26
# vector_test.cpp:18:             c[i] = a[i] * b[i];  // Different operation
	movss	%xmm0, (%rax)	# _26, *_25
.L7:
# vector_test.cpp:14:     for (int i = 0; i < n; i++) {
	addl	$1, -4(%rbp)	#, i
.L5:
# vector_test.cpp:14:     for (int i = 0; i < n; i++) {
	movl	-4(%rbp), %eax	# i, tmp136
	cmpl	-44(%rbp), %eax	# n, tmp136
	jl	.L8	#,
# vector_test.cpp:21: }
	nop	
	nop	
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2009:
	.size	_Z14add_arrays_badPKfS0_Pfi, .-_Z14add_arrays_badPKfS0_Pfi
	.section	.rodata
.LC0:
	.string	"c[0] = "
.LC1:
	.string	", c[100] = "
	.text
	.globl	main
	.type	main, @function
main:
.LFB2010:
	.cfi_startproc
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	pushq	-8(%r10)	#
	pushq	%rbp	#
	movq	%rsp, %rbp	#,
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	subq	$12328, %rsp	#,
# vector_test.cpp:29:     for (int i = 0; i < N; i++) {
	movl	$0, -20(%rbp)	#, i
# vector_test.cpp:29:     for (int i = 0; i < N; i++) {
	jmp	.L10	#
.L11:
# vector_test.cpp:30:         a[i] = i * 1.0f;
	pxor	%xmm0, %xmm0	# _1
	cvtsi2ssl	-20(%rbp), %xmm0	# i, _1
	movl	-20(%rbp), %eax	# i, tmp110
	cltq
	movss	%xmm0, -4144(%rbp,%rax,4)	# _1, a[i_10]
# vector_test.cpp:31:         b[i] = i * 2.0f;
	pxor	%xmm0, %xmm0	# _2
	cvtsi2ssl	-20(%rbp), %xmm0	# i, _2
	addss	%xmm0, %xmm0	# _2, _3
# vector_test.cpp:31:         b[i] = i * 2.0f;
	movl	-20(%rbp), %eax	# i, tmp112
	cltq
	movss	%xmm0, -8240(%rbp,%rax,4)	# _3, b[i_10]
# vector_test.cpp:29:     for (int i = 0; i < N; i++) {
	addl	$1, -20(%rbp)	#, i
.L10:
# vector_test.cpp:29:     for (int i = 0; i < N; i++) {
	cmpl	$1023, -20(%rbp)	#, i
	jle	.L11	#,
# vector_test.cpp:35:     add_arrays_good(a, b, c, N);
	leaq	-12336(%rbp), %rdx	#, tmp113
	leaq	-8240(%rbp), %rsi	#, tmp114
	leaq	-4144(%rbp), %rax	#, tmp115
	movl	$1024, %ecx	#,
	movq	%rax, %rdi	# tmp115,
	call	_Z15add_arrays_goodPKfS0_Pfi	#
# vector_test.cpp:36:     add_arrays_bad(a, b, c, N);
	leaq	-12336(%rbp), %rdx	#, tmp116
	leaq	-8240(%rbp), %rsi	#, tmp117
	leaq	-4144(%rbp), %rax	#, tmp118
	movl	$1024, %ecx	#,
	movq	%rax, %rdi	# tmp118,
	call	_Z14add_arrays_badPKfS0_Pfi	#
# vector_test.cpp:39:     std::cout << "c[0] = " << c[0] << ", c[100] = " << c[100] << std::endl;
	leaq	.LC0(%rip), %rax	#, tmp119
	movq	%rax, %rsi	# tmp119,
	leaq	_ZSt4cout(%rip), %rax	#, tmp120
	movq	%rax, %rdi	# tmp120,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
	movq	%rax, %rdx	#, _4
# vector_test.cpp:39:     std::cout << "c[0] = " << c[0] << ", c[100] = " << c[100] << std::endl;
	movl	-12336(%rbp), %eax	# c[0], _5
	movd	%eax, %xmm0	# _5,
	movq	%rdx, %rdi	# _4,
	call	_ZNSolsEf@PLT	#
	movq	%rax, %rdx	#, _6
# vector_test.cpp:39:     std::cout << "c[0] = " << c[0] << ", c[100] = " << c[100] << std::endl;
	leaq	.LC1(%rip), %rax	#, tmp121
	movq	%rax, %rsi	# tmp121,
	movq	%rdx, %rdi	# _6,
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT	#
	movq	%rax, %rdx	#, _7
# vector_test.cpp:39:     std::cout << "c[0] = " << c[0] << ", c[100] = " << c[100] << std::endl;
	movl	-11936(%rbp), %eax	# c[100], _8
	movd	%eax, %xmm0	# _8,
	movq	%rdx, %rdi	# _7,
	call	_ZNSolsEf@PLT	#
# vector_test.cpp:39:     std::cout << "c[0] = " << c[0] << ", c[100] = " << c[100] << std::endl;
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rdx	#, tmp123
	movq	%rdx, %rsi	# tmp122,
	movq	%rax, %rdi	# _9,
	call	_ZNSolsEPFRSoS_E@PLT	#
# vector_test.cpp:41:     return 0;
	movl	$0, %eax	#, _26
# vector_test.cpp:42: }
	movq	-8(%rbp), %r10	#,
	.cfi_def_cfa 10, 0
	leave	
	leaq	-8(%r10), %rsp	#,
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE2010:
	.size	main, .-main
	.section	.rodata
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIjEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedImEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedImEE:
	.byte	1
	.type	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, @object
	.size	_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE, 1
_ZNSt8__detail30__integer_to_chars_is_unsignedIyEE:
	.byte	1
	.ident	"GCC: (GNU) 14.3.0"
	.section	.note.GNU-stack,"",@progbits
