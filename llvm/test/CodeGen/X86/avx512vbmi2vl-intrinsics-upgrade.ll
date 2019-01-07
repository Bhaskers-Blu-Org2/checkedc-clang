; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+avx512vbmi2,+avx512vl --show-mc-encoding | FileCheck %s --check-prefixes=CHECK,X86
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512vbmi2,+avx512vl --show-mc-encoding | FileCheck %s --check-prefixes=CHECK,X64

define <8 x i16> @test_mask_expand_load_w_128(i8* %addr, <8 x i16> %data, i8 %mask) {
; X86-LABEL: test_mask_expand_load_w_128:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx # encoding: [0x0f,0xb6,0x4c,0x24,0x08]
; X86-NEXT:    kmovd %ecx, %k1 # encoding: [0xc5,0xfb,0x92,0xc9]
; X86-NEXT:    vpexpandw (%eax), %xmm0 {%k1} # encoding: [0x62,0xf2,0xfd,0x09,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_mask_expand_load_w_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpexpandw (%rdi), %xmm0 {%k1} # encoding: [0x62,0xf2,0xfd,0x09,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.avx512.mask.expand.load.w.128(i8* %addr, <8 x i16> %data, i8 %mask)
  ret <8 x i16> %res
}

define <8 x i16> @test_maskz_expand_load_w_128(i8* %addr, i8 %mask) {
; X86-LABEL: test_maskz_expand_load_w_128:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx # encoding: [0x0f,0xb6,0x4c,0x24,0x08]
; X86-NEXT:    kmovd %ecx, %k1 # encoding: [0xc5,0xfb,0x92,0xc9]
; X86-NEXT:    vpexpandw (%eax), %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0xfd,0x89,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_maskz_expand_load_w_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpexpandw (%rdi), %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0xfd,0x89,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.avx512.mask.expand.load.w.128(i8* %addr, <8 x i16> zeroinitializer, i8 %mask)
  ret <8 x i16> %res
}

declare <8 x i16> @llvm.x86.avx512.mask.expand.load.w.128(i8* %addr, <8 x i16> %data, i8 %mask)

define <8 x i16> @test_expand_load_w_128(i8* %addr, <8 x i16> %data) {
; X86-LABEL: test_expand_load_w_128:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X86-NEXT:    vpexpandw (%eax), %xmm0 {%k1} # encoding: [0x62,0xf2,0xfd,0x09,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_expand_load_w_128:
; X64:       # %bb.0:
; X64-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X64-NEXT:    vpexpandw (%rdi), %xmm0 {%k1} # encoding: [0x62,0xf2,0xfd,0x09,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.avx512.mask.expand.load.w.128(i8* %addr, <8 x i16> %data, i8 -1)
  ret <8 x i16> %res
}

define <16 x i8> @test_mask_expand_load_b_128(i8* %addr, <16 x i8> %data, i16 %mask) {
; X86-LABEL: test_mask_expand_load_b_128:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x08]
; X86-NEXT:    vpexpandb (%eax), %xmm0 {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_mask_expand_load_b_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpexpandb (%rdi), %xmm0 {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <16 x i8> @llvm.x86.avx512.mask.expand.load.b.128(i8* %addr, <16 x i8> %data, i16 %mask)
  ret <16 x i8> %res
}

define <16 x i8> @test_maskz_expand_load_b_128(i8* %addr, i16 %mask) {
; X86-LABEL: test_maskz_expand_load_b_128:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x08]
; X86-NEXT:    vpexpandb (%eax), %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0x7d,0x89,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_maskz_expand_load_b_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpexpandb (%rdi), %xmm0 {%k1} {z} # encoding: [0x62,0xf2,0x7d,0x89,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <16 x i8> @llvm.x86.avx512.mask.expand.load.b.128(i8* %addr, <16 x i8> zeroinitializer, i16 %mask)
  ret <16 x i8> %res
}

declare <16 x i8> @llvm.x86.avx512.mask.expand.load.b.128(i8* %addr, <16 x i8> %data, i16 %mask)

define <16 x i8> @test_expand_load_b_128(i8* %addr, <16 x i8> %data) {
; X86-LABEL: test_expand_load_b_128:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X86-NEXT:    vpexpandb (%eax), %xmm0 {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_expand_load_b_128:
; X64:       # %bb.0:
; X64-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X64-NEXT:    vpexpandb (%rdi), %xmm0 {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <16 x i8> @llvm.x86.avx512.mask.expand.load.b.128(i8* %addr, <16 x i8> %data, i16 -1)
  ret <16 x i8> %res
}

define void @test_mask_compress_store_w_128(i8* %addr, <8 x i16> %data, i8 %mask) {
; X86-LABEL: test_mask_compress_store_w_128:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx # encoding: [0x0f,0xb6,0x4c,0x24,0x08]
; X86-NEXT:    kmovd %ecx, %k1 # encoding: [0xc5,0xfb,0x92,0xc9]
; X86-NEXT:    vpcompressw %xmm0, (%eax) {%k1} # encoding: [0x62,0xf2,0xfd,0x09,0x63,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_mask_compress_store_w_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpcompressw %xmm0, (%rdi) {%k1} # encoding: [0x62,0xf2,0xfd,0x09,0x63,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  call void @llvm.x86.avx512.mask.compress.store.w.128(i8* %addr, <8 x i16> %data, i8 %mask)
  ret void
}

declare void @llvm.x86.avx512.mask.compress.store.w.128(i8* %addr, <8 x i16> %data, i8 %mask)

define void @test_compress_store_w_128(i8* %addr, <8 x i16> %data) {
; X86-LABEL: test_compress_store_w_128:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X86-NEXT:    vpcompressw %xmm0, (%eax) {%k1} # encoding: [0x62,0xf2,0xfd,0x09,0x63,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_compress_store_w_128:
; X64:       # %bb.0:
; X64-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X64-NEXT:    vpcompressw %xmm0, (%rdi) {%k1} # encoding: [0x62,0xf2,0xfd,0x09,0x63,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  call void @llvm.x86.avx512.mask.compress.store.w.128(i8* %addr, <8 x i16> %data, i8 -1)
  ret void
}

define void @test_mask_compress_store_b_128(i8* %addr, <16 x i8> %data, i16 %mask) {
; X86-LABEL: test_mask_compress_store_b_128:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x08]
; X86-NEXT:    vpcompressb %xmm0, (%eax) {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x63,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_mask_compress_store_b_128:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpcompressb %xmm0, (%rdi) {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x63,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  call void @llvm.x86.avx512.mask.compress.store.b.128(i8* %addr, <16 x i8> %data, i16 %mask)
  ret void
}

declare void @llvm.x86.avx512.mask.compress.store.b.128(i8* %addr, <16 x i8> %data, i16 %mask)

define void @test_compress_store_b_128(i8* %addr, <16 x i8> %data) {
; X86-LABEL: test_compress_store_b_128:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X86-NEXT:    vpcompressb %xmm0, (%eax) {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x63,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_compress_store_b_128:
; X64:       # %bb.0:
; X64-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X64-NEXT:    vpcompressb %xmm0, (%rdi) {%k1} # encoding: [0x62,0xf2,0x7d,0x09,0x63,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  call void @llvm.x86.avx512.mask.compress.store.b.128(i8* %addr, <16 x i8> %data, i16 -1)
  ret void
}

define <16 x i16> @test_mask_expand_load_w_256(i8* %addr, <16 x i16> %data, i16 %mask) {
; X86-LABEL: test_mask_expand_load_w_256:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x08]
; X86-NEXT:    vpexpandw (%eax), %ymm0 {%k1} # encoding: [0x62,0xf2,0xfd,0x29,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_mask_expand_load_w_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpexpandw (%rdi), %ymm0 {%k1} # encoding: [0x62,0xf2,0xfd,0x29,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <16 x i16> @llvm.x86.avx512.mask.expand.load.w.256(i8* %addr, <16 x i16> %data, i16 %mask)
  ret <16 x i16> %res
}

define <16 x i16> @test_maskz_expand_load_w_256(i8* %addr, i16 %mask) {
; X86-LABEL: test_maskz_expand_load_w_256:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x08]
; X86-NEXT:    vpexpandw (%eax), %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0xfd,0xa9,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_maskz_expand_load_w_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpexpandw (%rdi), %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0xfd,0xa9,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <16 x i16> @llvm.x86.avx512.mask.expand.load.w.256(i8* %addr, <16 x i16> zeroinitializer, i16 %mask)
  ret <16 x i16> %res
}

declare <16 x i16> @llvm.x86.avx512.mask.expand.load.w.256(i8* %addr, <16 x i16> %data, i16 %mask)

define <16 x i16> @test_expand_load_w_256(i8* %addr, <16 x i16> %data) {
; X86-LABEL: test_expand_load_w_256:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X86-NEXT:    vpexpandw (%eax), %ymm0 {%k1} # encoding: [0x62,0xf2,0xfd,0x29,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_expand_load_w_256:
; X64:       # %bb.0:
; X64-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X64-NEXT:    vpexpandw (%rdi), %ymm0 {%k1} # encoding: [0x62,0xf2,0xfd,0x29,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <16 x i16> @llvm.x86.avx512.mask.expand.load.w.256(i8* %addr, <16 x i16> %data, i16 -1)
  ret <16 x i16> %res
}

define <32 x i8> @test_mask_expand_load_b_256(i8* %addr, <32 x i8> %data, i32 %mask) {
; X86-LABEL: test_mask_expand_load_b_256:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kmovd {{[0-9]+}}(%esp), %k1 # encoding: [0xc4,0xe1,0xf9,0x90,0x4c,0x24,0x08]
; X86-NEXT:    vpexpandb (%eax), %ymm0 {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_mask_expand_load_b_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpexpandb (%rdi), %ymm0 {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <32 x i8> @llvm.x86.avx512.mask.expand.load.b.256(i8* %addr, <32 x i8> %data, i32 %mask)
  ret <32 x i8> %res
}

define <32 x i8> @test_maskz_expand_load_b_256(i8* %addr, i32 %mask) {
; X86-LABEL: test_maskz_expand_load_b_256:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kmovd {{[0-9]+}}(%esp), %k1 # encoding: [0xc4,0xe1,0xf9,0x90,0x4c,0x24,0x08]
; X86-NEXT:    vpexpandb (%eax), %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0x7d,0xa9,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_maskz_expand_load_b_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpexpandb (%rdi), %ymm0 {%k1} {z} # encoding: [0x62,0xf2,0x7d,0xa9,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <32 x i8> @llvm.x86.avx512.mask.expand.load.b.256(i8* %addr, <32 x i8> zeroinitializer, i32 %mask)
  ret <32 x i8> %res
}

declare <32 x i8> @llvm.x86.avx512.mask.expand.load.b.256(i8* %addr, <32 x i8> %data, i32 %mask)

define <32 x i8> @test_expand_load_b_256(i8* %addr, <32 x i8> %data) {
; X86-LABEL: test_expand_load_b_256:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kxnord %k0, %k0, %k1 # encoding: [0xc4,0xe1,0xfd,0x46,0xc8]
; X86-NEXT:    vpexpandb (%eax), %ymm0 {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x62,0x00]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_expand_load_b_256:
; X64:       # %bb.0:
; X64-NEXT:    kxnord %k0, %k0, %k1 # encoding: [0xc4,0xe1,0xfd,0x46,0xc8]
; X64-NEXT:    vpexpandb (%rdi), %ymm0 {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x62,0x07]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <32 x i8> @llvm.x86.avx512.mask.expand.load.b.256(i8* %addr, <32 x i8> %data, i32 -1)
  ret <32 x i8> %res
}

define void @test_mask_compress_store_w_256(i8* %addr, <16 x i16> %data, i16 %mask) {
; X86-LABEL: test_mask_compress_store_w_256:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x08]
; X86-NEXT:    vpcompressw %ymm0, (%eax) {%k1} # encoding: [0x62,0xf2,0xfd,0x29,0x63,0x00]
; X86-NEXT:    vzeroupper # encoding: [0xc5,0xf8,0x77]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_mask_compress_store_w_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpcompressw %ymm0, (%rdi) {%k1} # encoding: [0x62,0xf2,0xfd,0x29,0x63,0x07]
; X64-NEXT:    vzeroupper # encoding: [0xc5,0xf8,0x77]
; X64-NEXT:    retq # encoding: [0xc3]
  call void @llvm.x86.avx512.mask.compress.store.w.256(i8* %addr, <16 x i16> %data, i16 %mask)
  ret void
}

declare void @llvm.x86.avx512.mask.compress.store.w.256(i8* %addr, <16 x i16> %data, i16 %mask)

define void @test_compress_store_w_256(i8* %addr, <16 x i16> %data) {
; X86-LABEL: test_compress_store_w_256:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X86-NEXT:    vpcompressw %ymm0, (%eax) {%k1} # encoding: [0x62,0xf2,0xfd,0x29,0x63,0x00]
; X86-NEXT:    vzeroupper # encoding: [0xc5,0xf8,0x77]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_compress_store_w_256:
; X64:       # %bb.0:
; X64-NEXT:    kxnorw %k0, %k0, %k1 # encoding: [0xc5,0xfc,0x46,0xc8]
; X64-NEXT:    vpcompressw %ymm0, (%rdi) {%k1} # encoding: [0x62,0xf2,0xfd,0x29,0x63,0x07]
; X64-NEXT:    vzeroupper # encoding: [0xc5,0xf8,0x77]
; X64-NEXT:    retq # encoding: [0xc3]
  call void @llvm.x86.avx512.mask.compress.store.w.256(i8* %addr, <16 x i16> %data, i16 -1)
  ret void
}

define void @test_mask_compress_store_b_256(i8* %addr, <32 x i8> %data, i32 %mask) {
; X86-LABEL: test_mask_compress_store_b_256:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kmovd {{[0-9]+}}(%esp), %k1 # encoding: [0xc4,0xe1,0xf9,0x90,0x4c,0x24,0x08]
; X86-NEXT:    vpcompressb %ymm0, (%eax) {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x63,0x00]
; X86-NEXT:    vzeroupper # encoding: [0xc5,0xf8,0x77]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_mask_compress_store_b_256:
; X64:       # %bb.0:
; X64-NEXT:    kmovd %esi, %k1 # encoding: [0xc5,0xfb,0x92,0xce]
; X64-NEXT:    vpcompressb %ymm0, (%rdi) {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x63,0x07]
; X64-NEXT:    vzeroupper # encoding: [0xc5,0xf8,0x77]
; X64-NEXT:    retq # encoding: [0xc3]
  call void @llvm.x86.avx512.mask.compress.store.b.256(i8* %addr, <32 x i8> %data, i32 %mask)
  ret void
}

declare void @llvm.x86.avx512.mask.compress.store.b.256(i8* %addr, <32 x i8> %data, i32 %mask)

define void @test_compress_store_b_256(i8* %addr, <32 x i8> %data) {
; X86-LABEL: test_compress_store_b_256:
; X86:       # %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax # encoding: [0x8b,0x44,0x24,0x04]
; X86-NEXT:    kxnord %k0, %k0, %k1 # encoding: [0xc4,0xe1,0xfd,0x46,0xc8]
; X86-NEXT:    vpcompressb %ymm0, (%eax) {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x63,0x00]
; X86-NEXT:    vzeroupper # encoding: [0xc5,0xf8,0x77]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_compress_store_b_256:
; X64:       # %bb.0:
; X64-NEXT:    kxnord %k0, %k0, %k1 # encoding: [0xc4,0xe1,0xfd,0x46,0xc8]
; X64-NEXT:    vpcompressb %ymm0, (%rdi) {%k1} # encoding: [0x62,0xf2,0x7d,0x29,0x63,0x07]
; X64-NEXT:    vzeroupper # encoding: [0xc5,0xf8,0x77]
; X64-NEXT:    retq # encoding: [0xc3]
  call void @llvm.x86.avx512.mask.compress.store.b.256(i8* %addr, <32 x i8> %data, i32 -1)
  ret void
}

define <4 x i32>@test_int_x86_avx512_mask_vpshld_d_128(<4 x i32> %x0, <4 x i32> %x1,<4 x i32> %x3, i8 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshld_d_128:
; X86:       # %bb.0:
; X86-NEXT:    vpshldd $22, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0x7d,0x08,0x71,0xd9,0x16]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax # encoding: [0x0f,0xb6,0x44,0x24,0x04]
; X86-NEXT:    kmovd %eax, %k1 # encoding: [0xc5,0xfb,0x92,0xc8]
; X86-NEXT:    vpshldd $22, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0x7d,0x09,0x71,0xd1,0x16]
; X86-NEXT:    vpshldd $22, %xmm1, %xmm0, %xmm0 {%k1} {z} # encoding: [0x62,0xf3,0x7d,0x89,0x71,0xc1,0x16]
; X86-NEXT:    vpaddd %xmm0, %xmm3, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe1,0xfe,0xc0]
; X86-NEXT:    vpaddd %xmm0, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfe,0xc0]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshld_d_128:
; X64:       # %bb.0:
; X64-NEXT:    vpshldd $22, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0x7d,0x08,0x71,0xd9,0x16]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshldd $22, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0x7d,0x09,0x71,0xd1,0x16]
; X64-NEXT:    vpshldd $22, %xmm1, %xmm0, %xmm0 {%k1} {z} # encoding: [0x62,0xf3,0x7d,0x89,0x71,0xc1,0x16]
; X64-NEXT:    vpaddd %xmm0, %xmm3, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe1,0xfe,0xc0]
; X64-NEXT:    vpaddd %xmm0, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfe,0xc0]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <4 x i32> @llvm.x86.avx512.mask.vpshld.d.128(<4 x i32> %x0, <4 x i32> %x1, i32 22, <4 x i32> %x3, i8 %x4)
  %res1 = call <4 x i32> @llvm.x86.avx512.mask.vpshld.d.128(<4 x i32> %x0, <4 x i32> %x1, i32 22, <4 x i32> %x3, i8 -1)
  %res2 = call <4 x i32> @llvm.x86.avx512.mask.vpshld.d.128(<4 x i32> %x0, <4 x i32> %x1, i32 22, <4 x i32> zeroinitializer,i8 %x4)
  %res3 = add <4 x i32> %res, %res1
  %res4 = add <4 x i32> %res3, %res2
  ret <4 x i32> %res4
}
declare <4 x i32> @llvm.x86.avx512.mask.vpshld.d.128(<4 x i32>, <4 x i32>, i32, <4 x i32>, i8)

define <8 x i32>@test_int_x86_avx512_mask_vpshld_d_256(<8 x i32> %x0, <8 x i32> %x1, <8 x i32> %x3, i8 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshld_d_256:
; X86:       # %bb.0:
; X86-NEXT:    vpshldd $22, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0x7d,0x28,0x71,0xd9,0x16]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax # encoding: [0x0f,0xb6,0x44,0x24,0x04]
; X86-NEXT:    kmovd %eax, %k1 # encoding: [0xc5,0xfb,0x92,0xc8]
; X86-NEXT:    vpshldd $22, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0x7d,0x29,0x71,0xd1,0x16]
; X86-NEXT:    vpaddd %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfe,0xc3]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshld_d_256:
; X64:       # %bb.0:
; X64-NEXT:    vpshldd $22, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0x7d,0x28,0x71,0xd9,0x16]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshldd $22, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0x7d,0x29,0x71,0xd1,0x16]
; X64-NEXT:    vpaddd %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfe,0xc3]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <8 x i32> @llvm.x86.avx512.mask.vpshld.d.256(<8 x i32> %x0, <8 x i32> %x1, i32 22, <8 x i32> %x3, i8 %x4)
  %res1 = call <8 x i32> @llvm.x86.avx512.mask.vpshld.d.256(<8 x i32> %x0, <8 x i32> %x1, i32 22, <8 x i32> %x3, i8 -1)
  %res2 = add <8 x i32> %res, %res1
  ret <8 x i32> %res2
}
declare <8 x i32> @llvm.x86.avx512.mask.vpshld.d.256(<8 x i32>, <8 x i32>, i32, <8 x i32>, i8)

define <2 x i64>@test_int_x86_avx512_mask_vpshld_q_128(<2 x i64> %x0, <2 x i64> %x1, <2 x i64> %x3, i8 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshld_q_128:
; X86:       # %bb.0:
; X86-NEXT:    vpshldq $22, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0xfd,0x08,0x71,0xd9,0x16]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax # encoding: [0x0f,0xb6,0x44,0x24,0x04]
; X86-NEXT:    kmovd %eax, %k1 # encoding: [0xc5,0xfb,0x92,0xc8]
; X86-NEXT:    vpshldq $22, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x09,0x71,0xd1,0x16]
; X86-NEXT:    vpaddq %xmm3, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xd4,0xc3]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshld_q_128:
; X64:       # %bb.0:
; X64-NEXT:    vpshldq $22, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0xfd,0x08,0x71,0xd9,0x16]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshldq $22, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x09,0x71,0xd1,0x16]
; X64-NEXT:    vpaddq %xmm3, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xd4,0xc3]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <2 x i64> @llvm.x86.avx512.mask.vpshld.q.128(<2 x i64> %x0, <2 x i64> %x1, i32 22, <2 x i64> %x3, i8 %x4)
  %res1 = call <2 x i64> @llvm.x86.avx512.mask.vpshld.q.128(<2 x i64> %x0, <2 x i64> %x1, i32 22, <2 x i64> %x3, i8 -1)
  %res2 = add <2 x i64> %res, %res1
  ret <2 x i64> %res2
}
declare <2 x i64> @llvm.x86.avx512.mask.vpshld.q.128(<2 x i64>, <2 x i64>, i32, <2 x i64>, i8)

define <4 x i64>@test_int_x86_avx512_mask_vpshld_q_256(<4 x i64> %x0, <4 x i64> %x1, <4 x i64> %x3, i8 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshld_q_256:
; X86:       # %bb.0:
; X86-NEXT:    vpshldq $22, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0xfd,0x28,0x71,0xd9,0x16]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax # encoding: [0x0f,0xb6,0x44,0x24,0x04]
; X86-NEXT:    kmovd %eax, %k1 # encoding: [0xc5,0xfb,0x92,0xc8]
; X86-NEXT:    vpshldq $22, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x29,0x71,0xd1,0x16]
; X86-NEXT:    vpaddq %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xd4,0xc3]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshld_q_256:
; X64:       # %bb.0:
; X64-NEXT:    vpshldq $22, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0xfd,0x28,0x71,0xd9,0x16]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshldq $22, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x29,0x71,0xd1,0x16]
; X64-NEXT:    vpaddq %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xd4,0xc3]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <4 x i64> @llvm.x86.avx512.mask.vpshld.q.256(<4 x i64> %x0, <4 x i64> %x1, i32 22, <4 x i64> %x3, i8 %x4)
  %res1 = call <4 x i64> @llvm.x86.avx512.mask.vpshld.q.256(<4 x i64> %x0, <4 x i64> %x1, i32 22, <4 x i64> %x3, i8 -1)
  %res2 = add <4 x i64> %res, %res1
  ret <4 x i64> %res2
}
declare <4 x i64> @llvm.x86.avx512.mask.vpshld.q.256(<4 x i64>, <4 x i64>, i32, <4 x i64>, i8)

define <8 x i16>@test_int_x86_avx512_mask_vpshld_w_128(<8 x i16> %x0, <8 x i16> %x1, <8 x i16> %x3, i8 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshld_w_128:
; X86:       # %bb.0:
; X86-NEXT:    vpshldw $6, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0xfd,0x08,0x70,0xd9,0x06]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax # encoding: [0x0f,0xb6,0x44,0x24,0x04]
; X86-NEXT:    kmovd %eax, %k1 # encoding: [0xc5,0xfb,0x92,0xc8]
; X86-NEXT:    vpshldw $6, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x09,0x70,0xd1,0x06]
; X86-NEXT:    vpaddw %xmm3, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfd,0xc3]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshld_w_128:
; X64:       # %bb.0:
; X64-NEXT:    vpshldw $6, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0xfd,0x08,0x70,0xd9,0x06]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshldw $6, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x09,0x70,0xd1,0x06]
; X64-NEXT:    vpaddw %xmm3, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfd,0xc3]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.avx512.mask.vpshld.w.128(<8 x i16> %x0, <8 x i16> %x1, i32 6, <8 x i16> %x3, i8 %x4)
  %res1 = call <8 x i16> @llvm.x86.avx512.mask.vpshld.w.128(<8 x i16> %x0, <8 x i16> %x1, i32 6, <8 x i16> %x3, i8 -1)
  %res2 = add <8 x i16> %res, %res1
  ret <8 x i16> %res2
}
declare <8 x i16> @llvm.x86.avx512.mask.vpshld.w.128(<8 x i16>, <8 x i16>, i32, <8 x i16>, i8)

define <16 x i16>@test_int_x86_avx512_mask_vpshld_w_256(<16 x i16> %x0, <16 x i16> %x1, <16 x i16> %x3, i16 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshld_w_256:
; X86:       # %bb.0:
; X86-NEXT:    vpshldw $6, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0xfd,0x28,0x70,0xd9,0x06]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpshldw $6, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x29,0x70,0xd1,0x06]
; X86-NEXT:    vpaddw %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfd,0xc3]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshld_w_256:
; X64:       # %bb.0:
; X64-NEXT:    vpshldw $6, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0xfd,0x28,0x70,0xd9,0x06]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshldw $6, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x29,0x70,0xd1,0x06]
; X64-NEXT:    vpaddw %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfd,0xc3]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <16 x i16> @llvm.x86.avx512.mask.vpshld.w.256(<16 x i16> %x0, <16 x i16> %x1, i32 6, <16 x i16> %x3, i16 %x4)
  %res1 = call <16 x i16> @llvm.x86.avx512.mask.vpshld.w.256(<16 x i16> %x0, <16 x i16> %x1, i32 6, <16 x i16> %x3, i16 -1)
  %res2 = add <16 x i16> %res, %res1
  ret <16 x i16> %res2
}
declare <16 x i16> @llvm.x86.avx512.mask.vpshld.w.256(<16 x i16>, <16 x i16>, i32, <16 x i16>, i16)

define <4 x i32>@test_int_x86_avx512_mask_vpshrd_d_128(<4 x i32> %x0, <4 x i32> %x1,<4 x i32> %x3, i8 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshrd_d_128:
; X86:       # %bb.0:
; X86-NEXT:    vpshrdd $22, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0x7d,0x08,0x73,0xd9,0x16]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax # encoding: [0x0f,0xb6,0x44,0x24,0x04]
; X86-NEXT:    kmovd %eax, %k1 # encoding: [0xc5,0xfb,0x92,0xc8]
; X86-NEXT:    vpshrdd $22, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0x7d,0x09,0x73,0xd1,0x16]
; X86-NEXT:    vpshrdd $22, %xmm1, %xmm0, %xmm0 {%k1} {z} # encoding: [0x62,0xf3,0x7d,0x89,0x73,0xc1,0x16]
; X86-NEXT:    vpaddd %xmm0, %xmm3, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe1,0xfe,0xc0]
; X86-NEXT:    vpaddd %xmm0, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfe,0xc0]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshrd_d_128:
; X64:       # %bb.0:
; X64-NEXT:    vpshrdd $22, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0x7d,0x08,0x73,0xd9,0x16]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshrdd $22, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0x7d,0x09,0x73,0xd1,0x16]
; X64-NEXT:    vpshrdd $22, %xmm1, %xmm0, %xmm0 {%k1} {z} # encoding: [0x62,0xf3,0x7d,0x89,0x73,0xc1,0x16]
; X64-NEXT:    vpaddd %xmm0, %xmm3, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe1,0xfe,0xc0]
; X64-NEXT:    vpaddd %xmm0, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfe,0xc0]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <4 x i32> @llvm.x86.avx512.mask.vpshrd.d.128(<4 x i32> %x0, <4 x i32> %x1, i32 22, <4 x i32> %x3, i8 %x4)
  %res1 = call <4 x i32> @llvm.x86.avx512.mask.vpshrd.d.128(<4 x i32> %x0, <4 x i32> %x1, i32 22, <4 x i32> %x3, i8 -1)
  %res2 = call <4 x i32> @llvm.x86.avx512.mask.vpshrd.d.128(<4 x i32> %x0, <4 x i32> %x1, i32 22, <4 x i32> zeroinitializer,i8 %x4)
  %res3 = add <4 x i32> %res, %res1
  %res4 = add <4 x i32> %res3, %res2
  ret <4 x i32> %res4
}
declare <4 x i32> @llvm.x86.avx512.mask.vpshrd.d.128(<4 x i32>, <4 x i32>, i32, <4 x i32>, i8)

define <8 x i32>@test_int_x86_avx512_mask_vpshrd_d_256(<8 x i32> %x0, <8 x i32> %x1, <8 x i32> %x3, i8 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshrd_d_256:
; X86:       # %bb.0:
; X86-NEXT:    vpshrdd $22, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0x7d,0x28,0x73,0xd9,0x16]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax # encoding: [0x0f,0xb6,0x44,0x24,0x04]
; X86-NEXT:    kmovd %eax, %k1 # encoding: [0xc5,0xfb,0x92,0xc8]
; X86-NEXT:    vpshrdd $22, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0x7d,0x29,0x73,0xd1,0x16]
; X86-NEXT:    vpaddd %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfe,0xc3]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshrd_d_256:
; X64:       # %bb.0:
; X64-NEXT:    vpshrdd $22, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0x7d,0x28,0x73,0xd9,0x16]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshrdd $22, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0x7d,0x29,0x73,0xd1,0x16]
; X64-NEXT:    vpaddd %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfe,0xc3]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <8 x i32> @llvm.x86.avx512.mask.vpshrd.d.256(<8 x i32> %x0, <8 x i32> %x1, i32 22, <8 x i32> %x3, i8 %x4)
  %res1 = call <8 x i32> @llvm.x86.avx512.mask.vpshrd.d.256(<8 x i32> %x0, <8 x i32> %x1, i32 22, <8 x i32> %x3, i8 -1)
  %res2 = add <8 x i32> %res, %res1
  ret <8 x i32> %res2
}
declare <8 x i32> @llvm.x86.avx512.mask.vpshrd.d.256(<8 x i32>, <8 x i32>, i32, <8 x i32>, i8)

define <2 x i64>@test_int_x86_avx512_mask_vpshrd_q_128(<2 x i64> %x0, <2 x i64> %x1, <2 x i64> %x3, i8 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshrd_q_128:
; X86:       # %bb.0:
; X86-NEXT:    vpshrdq $22, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0xfd,0x08,0x73,0xd9,0x16]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax # encoding: [0x0f,0xb6,0x44,0x24,0x04]
; X86-NEXT:    kmovd %eax, %k1 # encoding: [0xc5,0xfb,0x92,0xc8]
; X86-NEXT:    vpshrdq $22, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x09,0x73,0xd1,0x16]
; X86-NEXT:    vpaddq %xmm3, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xd4,0xc3]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshrd_q_128:
; X64:       # %bb.0:
; X64-NEXT:    vpshrdq $22, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0xfd,0x08,0x73,0xd9,0x16]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshrdq $22, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x09,0x73,0xd1,0x16]
; X64-NEXT:    vpaddq %xmm3, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xd4,0xc3]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <2 x i64> @llvm.x86.avx512.mask.vpshrd.q.128(<2 x i64> %x0, <2 x i64> %x1, i32 22, <2 x i64> %x3, i8 %x4)
  %res1 = call <2 x i64> @llvm.x86.avx512.mask.vpshrd.q.128(<2 x i64> %x0, <2 x i64> %x1, i32 22, <2 x i64> %x3, i8 -1)
  %res2 = add <2 x i64> %res, %res1
  ret <2 x i64> %res2
}
declare <2 x i64> @llvm.x86.avx512.mask.vpshrd.q.128(<2 x i64>, <2 x i64>, i32, <2 x i64>, i8)

define <4 x i64>@test_int_x86_avx512_mask_vpshrd_q_256(<4 x i64> %x0, <4 x i64> %x1, <4 x i64> %x3, i8 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshrd_q_256:
; X86:       # %bb.0:
; X86-NEXT:    vpshrdq $22, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0xfd,0x28,0x73,0xd9,0x16]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax # encoding: [0x0f,0xb6,0x44,0x24,0x04]
; X86-NEXT:    kmovd %eax, %k1 # encoding: [0xc5,0xfb,0x92,0xc8]
; X86-NEXT:    vpshrdq $22, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x29,0x73,0xd1,0x16]
; X86-NEXT:    vpaddq %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xd4,0xc3]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshrd_q_256:
; X64:       # %bb.0:
; X64-NEXT:    vpshrdq $22, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0xfd,0x28,0x73,0xd9,0x16]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshrdq $22, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x29,0x73,0xd1,0x16]
; X64-NEXT:    vpaddq %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xd4,0xc3]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <4 x i64> @llvm.x86.avx512.mask.vpshrd.q.256(<4 x i64> %x0, <4 x i64> %x1, i32 22, <4 x i64> %x3, i8 %x4)
  %res1 = call <4 x i64> @llvm.x86.avx512.mask.vpshrd.q.256(<4 x i64> %x0, <4 x i64> %x1, i32 22, <4 x i64> %x3, i8 -1)
  %res2 = add <4 x i64> %res, %res1
  ret <4 x i64> %res2
}
declare <4 x i64> @llvm.x86.avx512.mask.vpshrd.q.256(<4 x i64>, <4 x i64>, i32, <4 x i64>, i8)

define <8 x i16>@test_int_x86_avx512_mask_vpshrd_w_128(<8 x i16> %x0, <8 x i16> %x1, <8 x i16> %x3, i8 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshrd_w_128:
; X86:       # %bb.0:
; X86-NEXT:    vpshrdw $6, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0xfd,0x08,0x72,0xd9,0x06]
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax # encoding: [0x0f,0xb6,0x44,0x24,0x04]
; X86-NEXT:    kmovd %eax, %k1 # encoding: [0xc5,0xfb,0x92,0xc8]
; X86-NEXT:    vpshrdw $6, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x09,0x72,0xd1,0x06]
; X86-NEXT:    vpaddw %xmm3, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfd,0xc3]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshrd_w_128:
; X64:       # %bb.0:
; X64-NEXT:    vpshrdw $6, %xmm1, %xmm0, %xmm3 # encoding: [0x62,0xf3,0xfd,0x08,0x72,0xd9,0x06]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshrdw $6, %xmm1, %xmm0, %xmm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x09,0x72,0xd1,0x06]
; X64-NEXT:    vpaddw %xmm3, %xmm2, %xmm0 # EVEX TO VEX Compression encoding: [0xc5,0xe9,0xfd,0xc3]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <8 x i16> @llvm.x86.avx512.mask.vpshrd.w.128(<8 x i16> %x0, <8 x i16> %x1, i32 6, <8 x i16> %x3, i8 %x4)
  %res1 = call <8 x i16> @llvm.x86.avx512.mask.vpshrd.w.128(<8 x i16> %x0, <8 x i16> %x1, i32 6, <8 x i16> %x3, i8 -1)
  %res2 = add <8 x i16> %res, %res1
  ret <8 x i16> %res2
}
declare <8 x i16> @llvm.x86.avx512.mask.vpshrd.w.128(<8 x i16>, <8 x i16>, i32, <8 x i16>, i8)

define <16 x i16>@test_int_x86_avx512_mask_vpshrd_w_256(<16 x i16> %x0, <16 x i16> %x1, <16 x i16> %x3, i16 %x4) {
; X86-LABEL: test_int_x86_avx512_mask_vpshrd_w_256:
; X86:       # %bb.0:
; X86-NEXT:    vpshrdw $6, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0xfd,0x28,0x72,0xd9,0x06]
; X86-NEXT:    kmovw {{[0-9]+}}(%esp), %k1 # encoding: [0xc5,0xf8,0x90,0x4c,0x24,0x04]
; X86-NEXT:    vpshrdw $6, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x29,0x72,0xd1,0x06]
; X86-NEXT:    vpaddw %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfd,0xc3]
; X86-NEXT:    retl # encoding: [0xc3]
;
; X64-LABEL: test_int_x86_avx512_mask_vpshrd_w_256:
; X64:       # %bb.0:
; X64-NEXT:    vpshrdw $6, %ymm1, %ymm0, %ymm3 # encoding: [0x62,0xf3,0xfd,0x28,0x72,0xd9,0x06]
; X64-NEXT:    kmovd %edi, %k1 # encoding: [0xc5,0xfb,0x92,0xcf]
; X64-NEXT:    vpshrdw $6, %ymm1, %ymm0, %ymm2 {%k1} # encoding: [0x62,0xf3,0xfd,0x29,0x72,0xd1,0x06]
; X64-NEXT:    vpaddw %ymm3, %ymm2, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xed,0xfd,0xc3]
; X64-NEXT:    retq # encoding: [0xc3]
  %res = call <16 x i16> @llvm.x86.avx512.mask.vpshrd.w.256(<16 x i16> %x0, <16 x i16> %x1, i32 6, <16 x i16> %x3, i16 %x4)
  %res1 = call <16 x i16> @llvm.x86.avx512.mask.vpshrd.w.256(<16 x i16> %x0, <16 x i16> %x1, i32 6, <16 x i16> %x3, i16 -1)
  %res2 = add <16 x i16> %res, %res1
  ret <16 x i16> %res2
}
declare <16 x i16> @llvm.x86.avx512.mask.vpshrd.w.256(<16 x i16>, <16 x i16>, i32, <16 x i16>, i16)