	BITS 64

	section .text
	global  memset

memset:
	xor rcx, rcx

.loop:
	cmp rcx, rdx
	je  .exit

	mov byte [rdi + rcx], sil
	inc rcx
	jmp .loop

.exit:
	mov rax, rdi
	ret
