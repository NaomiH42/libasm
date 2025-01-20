global ft_strcmp

section .text

ft_strcmp:
	mov rcx, 0
	
while:
	cmp byte[rdi + rcx], 0
	je return
	cmp byte[rsi + rcx], 0
	je return
	inc rcx
	jmp while

return:
	mov al, [rdi + rcx]
	mov bl, [rsi + rcx]
	sub al, bl
	movsx rax, al ; extends the sign to the higher bits of the register to fit
	ret