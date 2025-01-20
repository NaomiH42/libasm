global ft_read

extern __errno_location

ft_read:
	mov rax, 0
	syscall
	cmp rax, 0
	jl error
	mov r15, rax
	ret

error:
	neg rax
	mov r15, rax
	call __errno_location
	mov [rax], r15
	mov rax, -1
	ret
	