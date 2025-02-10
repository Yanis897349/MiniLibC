	BITS 64

	section .text
	global  memmove
	extern  memcpy

memmove:
	mov rax, rdi

	cmp rdi, rsi
	jl  .loop
	jmp .copy

.loop:
	test rdx, rdx
	je   .end

	dec rdx

	mov cl, byte [rsi + rdx]
	mov byte [rdi + rdx], cl

	jmp .loop

.copy:
	call memcpy wrt ..plt

.end:
	ret
