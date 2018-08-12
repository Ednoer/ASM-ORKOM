extern scanf
extern printf
extern fflush

section .data
	fmt1 db "%d", 0
	fmt2 db "%d", 10, 0
	
section .bss
	a resd 1
	
section .text
	global main
	
main:
	push a
	push fmt1
	call scanf
	add esp, 8
	
	mov eax, [a]
	mov ebx, [a]
	
	mul ebx
	mov ecx, 6
	mul ecx
	
	push eax
	push fmt2
	call printf
	add esp, 8
	
	push 0
	call fflush
	
exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
