global ft_write

extern __errno_location

section .text

ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jl error
	mov r15, rax
	call __errno_location
	mov byte[rax], 0
	mov rax, r15
	ret

error:
	neg rax
	mov r15, rax
	call __errno_location
	mov [rax], r15
	mov rax, -1
	ret
	