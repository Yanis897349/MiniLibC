	BITS 64

	section .text
	global  strcspn
	extern  strlen

strcspn:
	xor rdx, rdx
	xor rcx, rcx
	xor r8, r8

	test rsi, rsi
	je   .no_reject

	jmp .loop

.no_reject:
	call strlen wrt ..plt
	ret

.loop:
	mov  al, byte [rdi + rcx]
	test al, al
	je   .end

.loop_needle:
	mov  dl, byte [rsi + r8]
	test dl, dl
	je   .inc_haystack

	cmp al, dl
	je  .end

	inc r8
	jmp .loop_needle

.inc_haystack:
	xor r8, r8
	inc rcx
	jmp .loop

.end:
	mov rax, rcx
	ret
