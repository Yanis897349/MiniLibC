	BITS 64

	section .text
	global  strcmp

strcmp:
	xor rax, rax
	xor rdx, rdx
	xor rcx, rcx

.loop:
	mov al, byte [rdi + rcx]
	mov dl, byte [rsi + rcx]

	test al, al
	je   .end
	test dl, dl
	je   .end

	cmp al, dl
	jne .end

	inc rcx
	jmp .loop

.end:
	sub rax, rdx
	ret
