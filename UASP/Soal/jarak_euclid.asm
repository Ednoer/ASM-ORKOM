extern printf
extern fflush
extern scanf

section .data
	scan db "%f %f", 0
	print db "%.6f", 10, 0
	
	
section .bss
	a resd 1
	b resd 1
	c resd 1
	d resd 1
	e resd 1
	hasil resd 1
	
section .text
	global main
	
main:
	push b
	push a
	push scan
	call scanf
	add esp, 8
	
	fld dword [a]
	fld dword [a]
	fmulp 
	fstp dword [c]
	
	fld dword [b]
	fld dword [b]
	fmulp
	fstp dword [d]
	
	fld dword [c]
	fld dword [d]
	faddp
	fstp dword [e]
	
	fld dword [e]
	fsqrt
	fstp qword [hasil]
	
	push dword[hasil+4]
	push dword[hasil]
	push print
	call printf
	add esp, 8
	
exit:

	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80
