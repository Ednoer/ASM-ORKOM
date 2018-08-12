extern scanf
extern printf
extern fflush

section .data
	scan db "%f", 0
	scand db "%d", 0
	print db "%.1f", 10, 0
	
section .bss
	n resd 1
	suhu resd 1
	z dq 0
	
section .text
	global main

main:
	push n
	push scand
	call scanf
	add esp, 8
	
	mov esi, [n]
	fld qword [z]
	
LP:
	push suhu
	push scand
	call scanf
	add esp, 8
	
	fadd dword [suhu]
	sub esi, 1
	
	cmp esi, 0
	jne LP ;tidak sama dengan
	
	fidiv dword [n]
	fst qword [z]
	
	push dword [z+4]
	push dword [z]
	push print
	call printf
	add esp, 8
	
exit:
	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80
