extern scanf
extern printf
extern fflush

section .data
	ftm1 db "%d", 0
	ftm2 db "%d", 0
	ftm3 db "%d", 10, 0
	
section .bss
	a resd 1
	b resd 1
	
section .text
	global main

main:
	push a
	push ftm1
	call scanf
	add esp, 8
	
	push b
	push ftm2
	call scanf
	add esp, 8
	
	mov eax, [a]
	mov ebx, [b]
	add ebx, eax
	
	push ebx
	push ftm3
	call printf
	add esp, 8
	
	push 0
	call fflush
	
exit
	mov eax, 1
	mov ebx, 0
	int 0x80
	
