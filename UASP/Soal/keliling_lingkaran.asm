extern printf
extern scanf
extern fflush

section .data
	scan db "%f", 0
	print db "%.6f", 10, 0
	
section .bss
	jari resd 1
	hasil resd 1

	;2phiR
	
section .text
	global main
	
main:
	push jari
	push scan
	call scanf
	add esp, 8
	
	fld dword [jari]
	fldpi
	
	fmulp
	fstp qword [hasil]
	
	push dword [hasil+4]
	push dword [hasil]
	push print
	call printf
	add esp, 8
	
exit:
	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80
	
