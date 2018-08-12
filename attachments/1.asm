extern scanf
extern printf
extern fflush

section .data
	fmt1 db "%s %s", 0
	fmt2 db "%d", 10, 0
	
section .bss
	str1 resd 51
	str2 resd 2
	
section .text
	global main
	
main:
	push str2
	push str1
	push fmt1
	call scanf
	
	mov edx, 0
	mov ecx, 50

	mov al, [str2]
	mov edi, str1
equal
	repnz scasb
	je sama

print:
	push edx
	push fmt2
	call printf
	
exit:
	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80
	
sama:
	add edx,1 
	jmp equal
	

