	BITS 64

	section .text
	global  memcpy

memcpy:
	xor rcx, rcx

.loop:
	cmp rcx, rdx
	je  .exit

	mov al, byte [rsi + rcx]
	mov byte [rdi + rcx], al
	inc rcx
	jmp .loop

.exit:
	mov rax, rdi
	ret
