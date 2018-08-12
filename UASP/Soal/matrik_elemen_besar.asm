extern scanf
extern printf
extern fflush

section .data
	fmt1 db "%d", 0
	fmt2 db "%d", 10, 0
	array	dd	17,	14,	24,	11,	18
			dd	21,	6,	13,	19,	25
			dd	10,	22, 20, 12, 7
			dd	3,	15,	23,	5,	1
			dd	8,	4,	9,	16,	2
			
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
	jae benar ;lebih besar atau sama dengan
	
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
	mov eax, 24
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

;JA LokasiTujuan ( Jump If Above ) Lompat ke LokasiTujuan jika EAX lebih besar dari EBX
;JAE LokasiTujuan ( Jump If Above or Equal ) Lompat ke LokasiTujuan jika EAX lebih besar atau sama dengan EBX
;JNA LokasiTujuan ( Jump If Not Above ) Lompat ke LokasiTujuan jika EAX tidak lebih besar dari EBX
;JNAE LokasiTujuan ( Jump If Not Above or Equal ) Lompat ke LokasiTujuan jika EAX tidak lebih besar atau sama dengan EBX
;JB LokasiTujuan ( Jump If Below ) Lompat ke LokasiTujuan jika EAX lebih kecil dari EBX
;JBE LokasiTujuan ( Jump If Below or Equal ) Fungsinya sama dengan perintah JNA
;JNB LokasiTujuan ( Jump If Not Below ) Fungsinya sama dengan perintah JAE
;JNBE LokasiTujuan ( Jump If Not Below or Equal ) Fungsinya sama dengan perintah JA
;JE LokasiTujuan ( Jump If Equal ) Lompat ke LokasiTujuan jika EAX sama dengan EBX
;JNE LokasiTujuan ( Jump If Not Equal ) Lompat ke LokasiTujuan jika EAX tidak sama dengan EBX
;JG LokasiTujuan ( Jump If Greater ) Lompat ke LokasiTujuan jika EAX lebih besar dari EBX
;JGE LokasiTujuan ( Jump If Greater or Equal ) Lompat ke LokasiTujuan jika EAX lebih besar atau sama dengan EBX
;JNG LokasiTujuan ( Jump If Not Greater ) Lompat ke LokasiTujuan jika EAX tidak lebih besar dari EBX
;JNGE LokasiTujuan ( Jump If Not Greater or Equal ) Lompat ke LokasiTujuan jika EAX tidak lebih besar atau sama dengan EBX
;JL LokasiTujuan ( Jump If Less Than ) Fungsinya sama dengan perintah JNGE
;JLE LokasiTujuan ( Jump If Less or Equal ) Fungsinya sama dengan perintah JNG
;JNL LokasiTujuan ( Jump If Not Less Than ) Fungsinya sama dengan perintah JGE
;JNLE LokasiTujuan ( Jump If Not Less or Equal ) Fungsinya sama dengan perintah JG
;JZ LokasiTujuan ( Jump If Zero ) Fungsinya sama dengan JE
;JNZ LokasiTujuan ( Jump If Not Zero ) Fungsinya sama dengan JNE
