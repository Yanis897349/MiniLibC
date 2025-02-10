	BITS 64

	section .text
	global  strlen

strlen:
	xor rcx, rcx

.loop:
	mov  al, [rdi + rcx]
	test al, al
	je   .exit

	inc rcx
	jmp .loop

.exit:
	mov rax, rcx
	ret
