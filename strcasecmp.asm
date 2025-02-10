	BITS 64

	section .text
	global  strcasecmp

lower_al:
	cmp al, 'A'
	jl  .lower_return
	cmp al, 'Z'
	jg  .lower_return
	add al, 32
	jmp .lower_return

.lower_return:
	ret

lower_dl:
	cmp dl, 'A'
	jl  .lower_return
	cmp dl, 'Z'
	jg  .lower_return
	add dl, 32

.lower_return:
	ret

strcasecmp:
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

	call lower_al
	call lower_dl

	cmp al, dl
	jne .end

	inc rcx
	jmp .loop

.end:
	sub rax, rdx
	ret
