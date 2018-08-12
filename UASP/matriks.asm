
extern scanf
extern printf
extern fflush

section .data
	fmt1 db "%d", 0
	fmt2 db "%d", 10, 0
	array 		dd      17, 14, 24, 11, 18
				dd      21,  6, 13, 19, 25
				dd      10, 22, 20, 12,  7
				dd       3, 15, 23,  5,  1
				dd       8,  4,  9, 16,  2
				
section .bss
	a resd 1
	
section .text
	global main
	
main:
	push a
	push fmt1
	call scanf
	add esp, 8
	
	mov eax, [a]
	mov ebx, 20
	mul ebx
	
	cmp eax, 0
	je nol
	
	
benar:
	mov esi, edx
	jmp looping1

benar1:
	mov esi, edx
	jmp looping2
	
benar2:
	mov esi, edx
	jmp looping3
	
benar3:
	mov esi, edx
	jmp looping4

benar4:
	mov esi, edx
	jmp looping5
	
benar5:
	mov esi, edx
	jmp print
	
	
looping:
	mov edx, dword[array+eax]
	add eax, 4
	cmp edx, ebx
	mov ebx, edx
	jae benar
	
looping1:
	mov edx, dword[array+eax]
	add eax, 4
	cmp edx, ebx
	mov ebx, edx
	jae benar1
	
looping2:
	mov edx, dword[array+eax]
	add eax, 4
	cmp edx, ebx
	mov ebx, edx
	jae benar2
	
looping3:
	mov edx, dword[array+eax]
	add eax, 4
	cmp edx, ebx
	mov ebx, edx
	jae benar3

looping4:
	mov edx, dword[array+eax]
	add eax, 4
	cmp edx, ebx
	mov ebx, edx
	jae benar4
	
looping5:
	mov edx, dword[array+eax]
	add eax, 4
	cmp edx, ebx
	mov ebx, edx
	jae benar5
		
print:
	push esi
	push fmt2
	call printf
	add esp, 8
	
	jmp exit

nol:
	mov eax,24
	push eax
	push fmt2
	call printf
	add esp, 8
	
	jmp exit
	
	

exit:
	push 0
	call fflush
	mov eax, 1
	mov ebx, 0
	int 0x80
