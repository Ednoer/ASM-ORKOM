extern scanf
extern printf
extern fflush

section .data
	cetak db "%d", 10, 0
	fmt db "%d %d %d %d %d %d %d", 0
	dword_size equ 4

section .bss
	uts resd 1 ;30
	uas resd 1 ;30
	uasp resd 1 ;10
	utsp resd 1 ;10
	proj resd 1 ;10
	kuis resd 1 ;5
	tugas resd 1 ;5
	
section .text
	global main
	
	
main:
	push tugas 
	push kuis
	push proj
	push uasp
	push utsp
	push uas
	push uts
	push fmt
	call scanf
	add esp, 32
	
	
	push dword [tugas]
	push dword [kuis]
	push dword [proj]
	push dword [uasp]
	push dword [utsp]
	push dword [uas]
	push dword [uts]
	call nilai_akhir
	jmp exit
	
nilai_akhir:
	push ebp
	mov ebp, esp
	
	mov eax,[ebp+2*dword_size]
	mov ebx, 30
	mul ebx
	mov ecx, eax
	
	mov eax,[ebp+3*dword_size]
	mul ebx
	add ecx, eax
	
	mov eax,[ebp+4*dword_size]
	mov ebx, 10
	mul ebx
	add ecx, eax
	
	mov eax,[ebp+5*dword_size]
	mul ebx
	add ecx, eax
	
	mov eax,[ebp+6*dword_size]
	mul ebx
	add ecx, eax
	
	mov eax,[ebp+7*dword_size]
	mov ebx, 5
	mul ebx
	add ecx, eax
	
	mov eax,[ebp+8*dword_size]
	mul ebx
	add ecx, eax
	
	mov eax, ecx
	mov ebx, 100
	div ebx
	pop ebp
	
	cmp edx, 50 ;buat apa, buat koma o.5 | >
	jae bulat ;lebih besar atau sama dengan
	
	ret 8*dword_size
	
bulat:
	mov ecx, 1
	add eax, ecx
	
exit:
	push eax
	push cetak
	call printf
	add esp, 8
	
	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80
	
	
