extern printf
extern fflush
section .data
	ftm0 db "%s", 10, 0
	ftm1 db "Hello world!", 0

section .bss

section .text
	global main
	
main:
	push ftm1
	push ftm0
	call printf
	add esp, 8
	
	push 0
	call fflush
	
exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
	
