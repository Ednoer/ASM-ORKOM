section .data
	ftm1 db "Hello x86", 10
	len equ $-ftm1
section .text
	global main
main:
	mov eax, 4
	mov ebx, 1
	mov ecx, ftm1
	mov edx, len
	int 0x80

exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
