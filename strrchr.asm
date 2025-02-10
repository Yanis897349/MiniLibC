	BITS 64

	section .text
	global  strrchr
	extern  strlen

strrchr:
	xor rax, rax
	xor rcx, rcx

.loop:
	cmp byte [rdi + rcx], sil
	jne .not_found

	lea rax, [rdi + rcx]

.not_found:
	cmp byte [rdi + rcx], 0
	je  .exit

	inc rcx
	jmp .loop

.exit:
	ret
