global ft_strdup

extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

ft_strdup:
	call ft_strlen
	mov r15, rdi
	mov rdi, rax
	inc rdi
	call malloc
	; mov rax, 0
	cmp rax, 0
	je error
	mov rdi, rax
	mov rsi, r15
	call ft_strcpy
	ret

error:
	call __errno_location
	mov byte[rax], 12
	mov rax, 0
	ret