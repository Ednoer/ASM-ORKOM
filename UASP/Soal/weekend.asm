extern scanf
extern printf
extern fflush

section .data
	cetak	db "%s", 10, 0
	fmt		db "%s", 0
	sun		db "Sun", 0
	sat		db "Sat", 0
	weekend	db "weekend", 0
	weekday	db "weekday", 0
	
section .bss
	a resd 1
	
section .text
	global main
	
main:
	cld ; arah operasi string ke kanan
	push a
	push fmt
	call scanf
	add esp, 8
	
	mov esi, a
	
	mov edi, sun
	mov ecx, 3
	cmpsb
	je libur
	
	mov edi, sat
	mov ecx, 3
	cmpsb
	je libur
	
	mov eax, weekday
	push eax
	push cetak
	call printf
	add esp, 8
	jmp exit
	
libur:
	mov eax, weekend
	push eax
	push cetak
	call printf
	add esp, 8
	jmp exit

exit:
	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80
