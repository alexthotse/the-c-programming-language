	.text
	.intel_syntax noprefix
	.def	 main;
	.scl	2;
	.type	32;
	.endef
	.globl	main
	.align	16, 0x90
main:                                   # @main
.Ltmp0:
.seh_proc main
# BB#0:
	push	rbp
.Ltmp1:
	.seh_pushreg 5
	sub	rsp, 32
.Ltmp2:
	.seh_stackalloc 32
	lea	rbp, [rsp + 32]
.Ltmp3:
	.seh_setframe 5, 32
.Ltmp4:
	.seh_endprologue
	call	__main
	jmp	.LBB0_2
	.align	16, 0x90
.LBB0_1:                                # %.lr.ph
                                        #   in Loop: Header=BB0_2 Depth=1
	mov	ecx, eax
	call	putchar
.LBB0_2:                                # %.lr.ph
                                        # =>This Inner Loop Header: Depth=1
	call	getchar
	mov	dword ptr [rip + main.c], eax
	cmp	eax, -1
	jne	.LBB0_1
# BB#3:                                 # %._crit_edge
	xor	eax, eax
	add	rsp, 32
	pop	rbp
	ret
	.seh_handlerdata
	.text
.Ltmp5:
	.seh_endproc

	.lcomm	main.c,4,4              # @main.c
