	BITS 64

	section .text
	global  strstr

strstr:
	xor rdx, rdx
	xor rcx, rcx
	xor r8, r8

	test rsi, rsi
	je   .found

.loop:
	mov  al, byte [rdi + rcx]
	test al, al
	je   .not_found

.loop_needle:
	mov  al, byte [rsi + r8]
	test al, al
	je   .found

	lea rdx, byte [rdi + rcx]
	mov dl, byte [rdx + r8]

	cmp byte [rsi + r8], dl
	jne .inc_haystack

	inc r8
	jmp .loop_needle

.inc_haystack:
	xor r8, r8
	inc rcx
	jmp .loop

.not_found:
	xor rax, rax
	ret

.found:
	lea rax, [rdi + rcx]
	ret
