	BITS 64

	section .text
	global  strchr

strchr:
	xor rcx, rcx

.loop:
	mov  al, [rdi + rcx]
	test al, al
	je   .not_found

	cmp byte [rdi + rcx], sil
	je  .found

	inc rcx
	jmp .loop

.not_found:
	xor rax, rax
	ret

.found:
	lea rax, [rdi + rcx]
	ret
