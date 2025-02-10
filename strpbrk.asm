	BITS 64

	section .text
	global  strpbrk

strpbrk:
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
	mov  dl, byte [rsi + r8]
	test dl, dl
	je   .inc_haystack

	cmp al, dl
	je  .found

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
