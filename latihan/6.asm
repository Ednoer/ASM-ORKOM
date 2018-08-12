extern scanf
extern printf
extern fflush

section .data
	ftm1 db "%d %d %d %d", 0
	ftm2 db "%s", 10, 0
	satu db "lulus", 0
	dua db "tidak", 0
	
section .bss
	a resd 1
	b resd 1
	c resd 1
	d resd 1
	
section .text
	global main
	
main:
	push a
	push b
	push c
	push d
	push ftm1
	call scanf
	add esp, 8
	
	mov eax, [a]
	mov ebx, [b]
	add eax, ebx
	mov ecx, [c]
	add eax, ecx
	mov edx, [d]
	add eax, edx
	
	mov edx, 0
	mov eax, eax
	mov ecx, 4
	div ecx
	
	cmp eax, 40
	ja lulus
	
	cmp eax, 0
	ja glulus
	
lulus:
	push satu
	push ftm2
	call printf
	add esp, 8
	
	jmp exit
	
glulus:
	
	push dua
	push ftm2
	call printf
	add esp, 8
	
	jmp exit
	
exit:
	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80
	
