extern scanf
extern printf
extern fflush

section .data
	fmt1 db "%d", 0
	fmt2 db "%s", 10, 0
	satu db "tilang", 0
	dua db "sedang", 0
	tiga db "lambat", 0
	
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
	cmp eax, 60
	ja tilang
	
	cmp eax, 30
	ja sedang
	
	cmp eax, 1
	ja lambat
	
lambat:
	push tiga
	push fmt2
	call printf
	add esp, 8
	
	jmp exit
	
tilang:
	push satu
	push fmt2
	call printf
	add esp, 8
	
	jmp exit
	
sedang:
	push dua
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
