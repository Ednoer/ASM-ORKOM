extern scanf
extern printf
extern fflush

section .data
	ftm1 db "%d", 0
	ftm2 db "%s", 10, 0
	satu db "tilang", 0
	dua db "sedang", 0
	tiga db "lambat", 0

section .bss
	cepat resd 1

section .text
	global main

main :
	push cepat
	push ftm1
	call scanf
	add esp, 0
	
	mov eax, [cepat]
	
	cmp eax, 60
	ja a
	
	cmp eax, 30
	ja b
	
	cmp eax, 1
	ja c
	
a:
	push satu
	push ftm2
	call printf
	add esp, 8
	
	jmp exit
	
b:
	push dua
	push ftm2
	call printf
	add esp, 8
	
	jmp exit
	
c:
	push tiga
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
