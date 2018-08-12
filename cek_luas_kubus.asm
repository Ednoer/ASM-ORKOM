extern scanf
extern printf
extern fflush

section .data
	fmt1 db "%d", 0
	fmt2 db "%d", 10, 0

section .bss
	rusuk resd 1
	
section .text
	global main
	
main :
	push rusuk
	push fmt1
	call scanf
	add esp, 8
	
	mov eax, [rusuk]
	mul eax
	mov ebx, 6
	mul ebx
	
	push eax
	push fmt2
	call printf
	add esp, 8
	
	push 0
	call fflush
exit :
	mov eax, 1
	mov ebx, 0
	int 0x80
