global	ft_strlen

section	.text

ft_strlen:
	mov rcx, 0

while:
	cmp byte[rdi + rcx], 0
	je	return
	inc rcx
	jmp while

return:
	mov rax, rcx
	ret 
