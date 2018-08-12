extern scanf
extern printf
extern fflush

section .data
	cetak db "%d", 10, 0
	fmt db "%d", 0
	
section .bss
	a resd 1
	
section .text
	global main

main:
	call masukan
	ret
	
masukan:
	push a
	push fmt
	call scanf
	add esp, 8
	
	mov eax, [a]
	
	cmp eax, 0
	je exit
	
	call kuadrat
	
	ja masukan
	
kuadrat:
	mov ebx, [a]
	mul ebx
	
	push eax
	push cetak
	call printf
	add esp, 8
	ret	
exit:
	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80
