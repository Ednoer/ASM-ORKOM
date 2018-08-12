extern scanf
extern printf
extern fflush

section .data
	ftm1 db "%d", 0
	ftm2 db "%d", 10, 0
		
section .bss
	cek resd 1
		
section .text
	global main
		
main:
	push cek
	push ftm1
	call scanf
	add esp, 8
		
	mov eax, [cek]
	mov ebx, 0
	mov ecx, 6
	
looping:
	add ebx, ecx
	add ecx, 6
	
	cmp ecx, eax
	jbe looping
	
	push ebx
	push ftm2
	call printf
	add esp, 8
	
	push 0
	call fflush
exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
