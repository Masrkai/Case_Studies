	.file	"vector_test.cpp"
# GNU C++17 (GCC) version 14.3.0 (x86_64-unknown-linux-gnu)
#	compiled by GNU C version 14.3.0, GMP version 6.3.0, MPFR version 4.2.2, MPC version 1.3.1, isl version isl-0.20-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -march=znver3 -mmmx -mpopcnt -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -msse4a -mno-fma4 -mno-xop -mfma -mno-avx512f -mbmi -mbmi2 -maes -mpclmul -mno-avx512vl -mno-avx512bw -mno-avx512dq -mno-avx512cd -mno-avx512vbmi -mno-avx512ifma -mno-avx512vpopcntdq -mno-avx512vbmi2 -mno-gfni -mvpclmulqdq -mno-avx512vnni -mno-avx512bitalg -mno-avx512bf16 -mno-avx512vp2intersect -mno-3dnow -madx -mabm -mno-cldemote -mclflushopt -mclwb -mclzero -mcx16 -mno-enqcmd -mf16c -mfsgsbase -mfxsr -mno-hle -msahf -mno-lwp -mlzcnt -mmovbe -mno-movdir64b -mno-movdiri -mmwaitx -mno-pconfig -mpku -mprfchw -mno-ptwrite -mrdpid -mrdrnd -mrdseed -mno-rtm -mno-serialize -mno-sgx -msha -mshstk -mno-tbm -mno-tsxldtrk -mvaes -mno-waitpkg -mwbnoinvd -mxsave -mxsavec -mxsaveopt -mxsaves -mno-amx-tile -mno-amx-int8 -mno-amx-bf16 -mno-uintr -mno-hreset -mno-kl -mno-widekl -mno-avxvnni -mno-avx512fp16 -mno-avxifma -mno-avxvnniint8 -mno-avxneconvert -mno-cmpccxadd -mno-amx-fp16 -mno-prefetchi -mno-raoint -mno-amx-complex -mno-avxvnniint16 -mno-sm3 -mno-sha512 -mno-sm4 -mno-apxf -mno-usermsr --param=l1-cache-size=32 --param=l1-cache-line-size=64 --param=l2-cache-size=512 -mtune=znver3 -mno-omit-leaf-frame-pointer -O3 -fno-omit-frame-pointer -ftree-vectorize -fopt-info-vec-missed -fopt-info-vec-optimized -fopt-info-vec-note
	.text
#APP
	.globl _ZSt21ios_base_library_initv
#NO_APP
	.p2align 4
	.globl	_Z15add_arrays_goodPKfS0_Pfi
	.type	_Z15add_arrays_goodPKfS0_Pfi, @function
_Z15add_arrays_goodPKfS0_Pfi:
.LFB2354:
	.cfi_startproc
# vector_test.cpp:8:     for (int i = 0; i < n; i++) {
	testl	%ecx, %ecx	# n
	jle	.L25	#,
	leal	-1(%rcx), %r8d	#, _19
	movl	%ecx, %r9d	# n, niters.35
	cmpl	$2, %r8d	#, _19
	jbe	.L3	#,
	leaq	-4(%rdx), %rax	#, _44
	movq	%rax, %r10	# _44, _32
	subq	%rdi, %r10	# a, _32
	cmpq	$24, %r10	#, _32
	jbe	.L3	#,
	subq	%rsi, %rax	# b, _38
	cmpq	$24, %rax	#, _38
	jbe	.L3	#,
	cmpl	$6, %r8d	#, _19
	jbe	.L11	#,
	movl	%ecx, %r8d	# n, bnd.23_73
	xorl	%eax, %eax	# ivtmp.63
	shrl	$3, %r8d	#,
	salq	$5, %r8	#, _70
	.p2align 5
	.p2align 4
	.p2align 3
.L5:
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovups	(%rsi,%rax), %ymm0	# MEM <const vector(8) float> [(const float *)b_14(D) + ivtmp.63_107 * 1], vect__6.31_83
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vaddps	(%rdi,%rax), %ymm0, %ymm0	# MEM <const vector(8) float> [(const float *)a_13(D) + ivtmp.63_107 * 1], vect__6.31_83, vect__8.32_84
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovups	%ymm0, (%rdx,%rax)	# vect__8.32_84, MEM <vector(8) float> [(float *)c_15(D) + ivtmp.63_107 * 1]
	addq	$32, %rax	#, ivtmp.63
	cmpq	%rax, %r8	# ivtmp.63, _70
	jne	.L5	#,
	movl	%ecx, %eax	# n, tmp.38
	andl	$-8, %eax	#, tmp.38
	movl	%eax, %r8d	# tmp.38,
	cmpl	%eax, %ecx	# tmp.38, n
	je	.L23	#,
	movl	%ecx, %r9d	# n, niters.35
	subl	%eax, %r9d	# tmp.38, niters.35
	leal	-1(%r9), %r10d	#, _109
	cmpl	$2, %r10d	#, _109
	jbe	.L27	#,
	vzeroupper
.L4:
	salq	$2, %r8	#, _118
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovups	(%rsi,%r8), %xmm0	# MEM <const vector(4) float> [(const float *)vectp_b.43_122], vect__62.44_127
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vaddps	(%rdi,%r8), %xmm0, %xmm0	# MEM <const vector(4) float> [(const float *)vectp_a.40_116], vect__62.44_127, vect__64.45_128
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovups	%xmm0, (%rdx,%r8)	# vect__64.45_128, MEM <vector(4) float> [(float *)vectp_c.47_129]
	movl	%r9d, %r8d	# niters.35, niters_vector_mult_vf.37_113
	andl	$-4, %r8d	#, niters_vector_mult_vf.37_113
	addl	%r8d, %eax	# niters_vector_mult_vf.37_113, tmp.38
	andl	$3, %r9d	#, niters.35
	je	.L25	#,
.L7:
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	movslq	%eax, %r8	# tmp.38, _2
# vector_test.cpp:8:     for (int i = 0; i < n; i++) {
	leal	1(%rax), %r9d	#, i_57
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	salq	$2, %r8	#, _3
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovss	(%rdi,%r8), %xmm0	# *_4, *_4
	vaddss	(%rsi,%r8), %xmm0, %xmm0	# *_6, *_4, _17
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovss	%xmm0, (%rdx,%r8)	# _17, *_8
# vector_test.cpp:8:     for (int i = 0; i < n; i++) {
	cmpl	%r9d, %ecx	# i_57, n
	jle	.L25	#,
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovss	4(%rdi,%r8), %xmm0	# *_62, *_62
# vector_test.cpp:8:     for (int i = 0; i < n; i++) {
	addl	$2, %eax	#, i_124
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vaddss	4(%rsi,%r8), %xmm0, %xmm0	# *_64, *_62, _106
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovss	%xmm0, 4(%rdx,%r8)	# _106, *_68
# vector_test.cpp:8:     for (int i = 0; i < n; i++) {
	cmpl	%eax, %ecx	# i_124, n
	jle	.L25	#,
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovss	8(%rdi,%r8), %xmm0	# *_97, *_97
	vaddss	8(%rsi,%r8), %xmm0, %xmm0	# *_99, *_97, _102
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovss	%xmm0, 8(%rdx,%r8)	# _102, *_101
	ret	
.L23:
	vzeroupper
.L25:
# vector_test.cpp:11: }
	ret	
.L27:
	vzeroupper
	jmp	.L7	#
	.p2align 4
	.p2align 3
.L3:
	movslq	%ecx, %rcx	# n, _136
# vector_test.cpp:8:     for (int i = 0; i < n; i++) {
	xorl	%eax, %eax	# ivtmp.58
	salq	$2, %rcx	#, _108
	.p2align 5
	.p2align 4
	.p2align 3
.L9:
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovss	(%rdi,%rax), %xmm0	# MEM[(const float *)a_13(D) + ivtmp.58_93 * 1], MEM[(const float *)a_13(D) + ivtmp.58_93 * 1]
	vaddss	(%rsi,%rax), %xmm0, %xmm0	# MEM[(const float *)b_14(D) + ivtmp.58_93 * 1], MEM[(const float *)a_13(D) + ivtmp.58_93 * 1], _50
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovss	%xmm0, (%rdx,%rax)	# _50, MEM[(float *)c_15(D) + ivtmp.58_93 * 1]
# vector_test.cpp:8:     for (int i = 0; i < n; i++) {
	addq	$4, %rax	#, ivtmp.58
	cmpq	%rcx, %rax	# _108, ivtmp.58
	jne	.L9	#,
	ret	
.L11:
	xorl	%r8d, %r8d	#
# vector_test.cpp:8:     for (int i = 0; i < n; i++) {
	xorl	%eax, %eax	# tmp.38
	jmp	.L4	#
	.cfi_endproc
.LFE2354:
	.size	_Z15add_arrays_goodPKfS0_Pfi, .-_Z15add_arrays_goodPKfS0_Pfi
	.p2align 4
	.globl	_Z14add_arrays_badPKfS0_Pfi
	.type	_Z14add_arrays_badPKfS0_Pfi, @function
_Z14add_arrays_badPKfS0_Pfi:
.LFB2355:
	.cfi_startproc
	movslq	%ecx, %r8	# n, _38
# vector_test.cpp:15:     for (int i = 0; i < n; i++) {
	xorl	%eax, %eax	# ivtmp.75
	testl	%ecx, %ecx	# n
	jle	.L35	#,
	.p2align 5
	.p2align 4
	.p2align 3
.L33:
# vector_test.cpp:17:             c[i] = a[i] + b[i];
	vmovss	(%rdi,%rax,4), %xmm0	# MEM[(const float *)a_23(D) + ivtmp.75_27 * 4], pretmp_44
# vector_test.cpp:17:             c[i] = a[i] + b[i];
	vmovss	(%rsi,%rax,4), %xmm1	# MEM[(const float *)b_24(D) + ivtmp.75_27 * 4], pretmp_46
# vector_test.cpp:16:         if (i % 2 == 0) {  // Conditional branch
	testb	$1, %al	#, ivtmp.75
	jne	.L30	#,
# vector_test.cpp:17:             c[i] = a[i] + b[i];
	vaddss	%xmm1, %xmm0, %xmm0	# pretmp_46, pretmp_44, _8
# vector_test.cpp:17:             c[i] = a[i] + b[i];
	vmovss	%xmm0, (%rdx,%rax,4)	# _8, MEM[(float *)c_25(D) + ivtmp.75_27 * 4]
# vector_test.cpp:15:     for (int i = 0; i < n; i++) {
	incq	%rax	# ivtmp.75
	cmpq	%rax, %r8	# ivtmp.75, _38
	jne	.L33	#,
	ret	
	.p2align 4
	.p2align 3
.L30:
# vector_test.cpp:19:             c[i] = a[i] * b[i];  // Different operation
	vmulss	%xmm1, %xmm0, %xmm0	# pretmp_46, pretmp_44, _16
# vector_test.cpp:17:             c[i] = a[i] + b[i];
	vmovss	%xmm0, (%rdx,%rax,4)	# _16, MEM[(float *)c_25(D) + ivtmp.75_27 * 4]
# vector_test.cpp:15:     for (int i = 0; i < n; i++) {
	incq	%rax	# ivtmp.75
	cmpq	%r8, %rax	# _38, ivtmp.75
	jne	.L33	#,
.L35:
# vector_test.cpp:22: }
	ret	
	.cfi_endproc
.LFE2355:
	.size	_Z14add_arrays_badPKfS0_Pfi, .-_Z14add_arrays_badPKfS0_Pfi
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"c[0] = "
.LC3:
	.string	", c[100] = "
	.section	.text.unlikely,"ax",@progbits
.LCOLDB4:
	.section	.text.startup,"ax",@progbits
.LHOTB4:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB2356:
	.cfi_startproc
	leaq	8(%rsp), %r10	#,
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp	#,
	movl	$8, %edx	#, tmp127
	xorl	%eax, %eax	# ivtmp.119
	pushq	-8(%r10)	#
	pushq	%rbp	#
	vmovd	%edx, %xmm2	# tmp127, tmp126
	vpbroadcastd	%xmm2, %ymm2	# tmp126, tmp126
	movq	%rsp, %rbp	#,
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r12	#
	pushq	%r10	#
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
	pushq	%rbx	#
	subq	$12312, %rsp	#,
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
# vector_test.cpp:24: int main() {
	vmovdqa	.LC0(%rip), %ymm1	#, vect_vec_iv_.97
	leaq	-12336(%rbp), %rdi	#, tmp154
	leaq	-8240(%rbp), %rsi	#, tmp153
	.p2align 6
	.p2align 4
	.p2align 3
.L37:
	vmovdqa	%ymm1, %ymm0	# vect_vec_iv_.97, vect_vec_iv_.97
	vpaddd	%ymm2, %ymm1, %ymm1	# tmp126, vect_vec_iv_.97, vect_vec_iv_.97
# vector_test.cpp:31:         a[i] = i * 1.0f;
	vcvtdq2ps	%ymm0, %ymm0	# vect_vec_iv_.97, vect__1.98
	vmovaps	%ymm0, (%rdi,%rax)	# vect__1.98, MEM <vector(8) float> [(float *)&a + ivtmp.119_1 * 1]
# vector_test.cpp:32:         b[i] = i * 2.0f;
	vaddps	%ymm0, %ymm0, %ymm0	# vect__1.98, vect__1.98, vect__2.101_82
# vector_test.cpp:32:         b[i] = i * 2.0f;
	vmovaps	%ymm0, (%rsi,%rax)	# vect__2.101_82, MEM <vector(8) float> [(float *)&b + ivtmp.119_1 * 1]
	addq	$32, %rax	#, ivtmp.119
	cmpq	$4096, %rax	#, ivtmp.119
	jne	.L37	#,
	xorl	%eax, %eax	# ivtmp.109
	leaq	-4144(%rbp), %rdx	#, tmp152
	.p2align 5
	.p2align 4
	.p2align 3
.L38:
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovaps	(%rsi,%rax), %ymm0	# MEM <const vector(8) float> [(const float *)&b + ivtmp.109_51 * 1], MEM <const vector(8) float> [(const float *)&b + ivtmp.109_51 * 1]
	vaddps	(%rdi,%rax), %ymm0, %ymm0	# MEM <const vector(8) float> [(const float *)&a + ivtmp.109_51 * 1], MEM <const vector(8) float> [(const float *)&b + ivtmp.109_51 * 1], vect__23.94_68
# vector_test.cpp:9:         c[i] = a[i] + b[i];
	vmovaps	%ymm0, (%rdx,%rax)	# vect__23.94_68, MEM <vector(8) float> [(float *)&c + ivtmp.109_51 * 1]
	addq	$32, %rax	#, ivtmp.109
	cmpq	$4096, %rax	#, ivtmp.109
	jne	.L38	#,
# vector_test.cpp:37:     add_arrays_bad(a, b, c, N);
	movl	$1024, %ecx	#,
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/ostream:676: 	__ostream_insert(__out, __s,
	leaq	_ZSt4cout(%rip), %rbx	#, tmp140
# vector_test.cpp:37:     add_arrays_bad(a, b, c, N);
	call	_Z14add_arrays_badPKfS0_Pfi	#
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/ostream:676: 	__ostream_insert(__out, __s,
	movl	$7, %edx	#,
	leaq	.LC2(%rip), %rsi	#, tmp139
	movq	%rbx, %rdi	# tmp140,
	vzeroupper
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/ostream:239: 	return _M_insert(static_cast<double>(__f));
	vxorpd	%xmm3, %xmm3, %xmm3	# tmp163
	movq	%rbx, %rdi	# tmp140,
	vcvtss2sd	-4144(%rbp), %xmm3, %xmm0	# c[0], tmp163, tmp160
	call	_ZNSo9_M_insertIdEERSoT_@PLT	#
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/ostream:676: 	__ostream_insert(__out, __s,
	movl	$11, %edx	#,
	leaq	.LC3(%rip), %rsi	#, tmp143
	movq	%rax, %rdi	# _26,
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/ostream:239: 	return _M_insert(static_cast<double>(__f));
	movq	%rax, %rbx	# tmp155, _26
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/ostream:676: 	__ostream_insert(__out, __s,
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT	#
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/ostream:239: 	return _M_insert(static_cast<double>(__f));
	vxorpd	%xmm3, %xmm3, %xmm3	# tmp164
	movq	%rbx, %rdi	# _26,
	vcvtss2sd	-3744(%rbp), %xmm3, %xmm0	# c[100], tmp164, tmp161
	call	_ZNSo9_M_insertIdEERSoT_@PLT	#
	movq	%rax, %rbx	# tmp156, _28
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/ostream:745:     { return flush(__os.put(__os.widen('\n'))); }
	movq	(%rax), %rax	# MEM[(struct basic_ostream *)_28]._vptr.basic_ostream, MEM[(struct basic_ostream *)_28]._vptr.basic_ostream
	movq	-24(%rax), %rax	# MEM[(long int *)_36 + -24B], MEM[(long int *)_36 + -24B]
	movq	240(%rbx,%rax), %r12	# MEM[(const struct __ctype_type * *)_39 + 240B], _44
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/bits/basic_ios.h:49:       if (!__f)
	testq	%r12, %r12	# _44
	je	.L44	#,
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/bits/locale_facets.h:882: 	if (_M_widen_ok)
	cmpb	$0, 56(%r12)	#, MEM[(const struct ctype *)_44]._M_widen_ok
	je	.L40	#,
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/bits/locale_facets.h:883: 	  return _M_widen[static_cast<unsigned char>(__c)];
	movzbl	67(%r12), %eax	# MEM[(const struct ctype *)_44]._M_widen[10], _52
.L41:
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/ostream:745:     { return flush(__os.put(__os.widen('\n'))); }
	movq	%rbx, %rdi	# _28,
	movsbl	%al, %esi	# _52, _41
	call	_ZNSo3putEc@PLT	#
	movq	%rax, %rdi	# tmp158, _42
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/ostream:767:     { return __os.flush(); }
	call	_ZNSo5flushEv@PLT	#
# vector_test.cpp:43: }
	addq	$12312, %rsp	#,
	xorl	%eax, %eax	#
	popq	%rbx	#
	popq	%r10	#
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12	#
	popq	%rbp	#
	leaq	-8(%r10), %rsp	#,
	.cfi_def_cfa 7, 8
	ret	
.L40:
	.cfi_restore_state
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/bits/locale_facets.h:884: 	this->_M_widen_init();
	movq	%r12, %rdi	# _44,
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT	#
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/bits/locale_facets.h:885: 	return this->do_widen(__c);
	movq	(%r12), %rax	# MEM[(const struct ctype *)_44].D.43803._vptr.facet, MEM[(const struct ctype *)_44].D.43803._vptr.facet
	movl	$10, %esi	#,
	movq	%r12, %rdi	# _44,
	call	*48(%rax)	# MEM[(int (*) () *)_54 + 48B]
	jmp	.L41	#
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB2356:
.L44:
	.cfi_escape 0xf,0x3,0x76,0x70,0x6
	.cfi_escape 0x10,0x3,0x2,0x76,0x68
	.cfi_escape 0x10,0x6,0x2,0x76,0
	.cfi_escape 0x10,0xc,0x2,0x76,0x78
# /nix/store/nijijzdw2m5lh25q7d4m03wp7wm4xmvn-gcc-14.3.0/include/c++/14.3.0/bits/basic_ios.h:50: 	__throw_bad_cast();
	call	_ZSt16__throw_bad_castv@PLT	#
	.cfi_endproc
.LFE2356:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE4:
	.section	.text.startup
.LHOTE4:
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.ident	"GCC: (GNU) 14.3.0"
	.section	.note.GNU-stack,"",@progbits
