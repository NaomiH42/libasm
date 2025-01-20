global ft_strcpy

extern ft_strlen

section .text

ft_strcpy:
	mov rcx, 0
	
while:
	cmp byte[rsi + rcx], 0
	je return
	mov bl, [rsi + rcx]
	mov [rdi + rcx], bl	
	inc rcx
	jmp while

return:
	mov bl, [rsi + rcx]
	mov [rdi + rcx], bl	
	mov rax, rdi
	ret