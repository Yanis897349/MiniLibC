	BITS 64

	section .text
	global  strncmp

strcmp:
	xor rax, rax
	xor rcx, rcx
	xor r8, r8

	test rdx, rdx
	je   .end

.loop:
	mov al, byte [rdi + rcx]
	mov r8b, byte [rsi + rcx]

	test al, al
	je   .end
	test r8b, r8b
	je   .end

	cmp al, r8b
	jne .end

	cmp rdx, rcx
	je  .end

	inc rcx
	jmp .loop

.end:
	sub rax, r8
	ret
