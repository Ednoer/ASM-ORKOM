extern printf
extern fflush

section .data
	ftm1 db "%s", 0
	ftm2 db "Hello world!", 10, 0
	
section .bss

section .text
	global main
	
main:
	push ftm2
	push ftm1
	call printf
	add esp, 8
	
exit:
	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80
