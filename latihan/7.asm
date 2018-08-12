extern scanf
extern printf
extern fflush

section .data
	ftm1 db "%d %d %d %d", 0
	ftm2 db "%s", 10, 0
	satu db "A", 0
	dua db "B", 0
	tiga db "C", 0
	empat db "D", 0
	lima db "E", 0
	
section .bss
	a resd 1
	b resd 1
	c resd 1
	d resd 1
	
section .text
	global main
	
main:
	push a
	push b
	push c
	push d
	push ftm1
	call scanf
	add esp, 8
	
	mov eax, [a]
	mov ebx, [b]
	add eax, ebx
	mov ecx, [c]
	add eax, ecx
	mov edx, [d]
	add eax, edx
	
	mov edx, 0
	mov eax, eax
	mov ecx, 4
	div ecx
	
	cmp eax, 80
	ja lulus1
	
	cmp eax, 60
	ja lulus2
	
	cmp eax, 50
	ja lulus3
	
	cmp eax, 40
	ja lulus4
	
	cmp eax, 0
	ja lulus5
	
	
lulus1:
	push satu
	push ftm2
	call printf
	add esp, 8
	
	jmp exit
	
lulus2:
	push dua
	push ftm2
	call printf
	add esp, 8
	
	jmp exit

lulus3:
	push tiga
	push ftm2
	call printf
	add esp, 8
	
	jmp exit
	
lulus4:
	push empat
	push ftm2
	call printf
	add esp, 8
	
	jmp exit

lulus5:
	push lima
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
	
