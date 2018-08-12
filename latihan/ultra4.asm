extern scanf
extern printf
extern fflush

section .data
	fmt1 db "%f", 0
	fmt2 db "%.2f", 10, 0
	nilai dd 1.8
	nilai1 dd 32.0
	
section .bss
	result resd 1
	a resd 1
	result1 resd 1
	
section .text
	global main
	
main:
	push a
	push fmt1
	call scanf
	
	mov eax, nilai
	
	fld dword[a]
	fmul dword[nilai]
	fadd dword[nilai1]
	
	fstp qword[result]
	
	push dword[result+4]
	push dword[result]
	push fmt2
	call printf
	
exit:
	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80
	
	
