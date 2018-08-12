section .data
	ftm1 db "Hello "
	len equ $-ftm1
	len_masuk dd 7
	 
section .bss
	input resd 1

section .text
	global main
	
main:
	mov eax, 3
	mov ebx, 0
	mov ecx, input
	mov edx, len_masuk
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, ftm1
	mov edx, len
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, input
	mov edx, 5
	int 0x80
	
exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
