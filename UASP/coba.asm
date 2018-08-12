extern scanf
extern printf
extern fflush

section .data
	cetak 	db "%d", 10, 0
	fmt		db "%d %d", 0
	array	dd 7, 11, 10, 6
			dd 5, 8, 9, 2
			dd 1, 3, 12, 4
			
section .bss
	a resd 1
	b resd 1
	
segment .text
	global main
	
main:
	push a
	push b
	push fmt
	call scanf
	add esp, 12
	
	mov eax, [b]
	mov ebx, 16
	mul ebx
	
	mov ecx, eax
	
	mov eax, [a]
	mov edx, 4
	mul edx
	
	add eax, ecx
	
	push dword[array+eax]
	push cetak
	call printf
	add esp, 8
	
exit:
	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80
	
