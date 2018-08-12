extern scanf
extern printf
extern fflush

section .data
 scan db "%d", 0
 prin db "%d", 10, 0
 
section .bss
 a resd 1
 temp resd 1
 
section .text


global main
 
main:
 push a
 push scan
 call scanf
 add esp, 8
 
 mov dword[temp], 0
 mov dword[temp+4], 1
 mov ebx, 0  ; buat index yang sebelumnya
 mov ecx, 46  ;looping sampe 46 kali
 mov eax, 1  ; nyimpen hasil
 mov edi, 2  ; buat index yg dicari    ;edi salah satu register
 
looping:
 add eax, dword[temp+4*ebx]
 mov dword[temp+4*edi], eax
 inc ebx
 inc edi
 loop looping
 
 mov ebx, [a]
 mov eax, dword[temp+4*ebx]
 
 push eax
 push prin
 call printf
 add esp, 8
exit:
 push 0
 call fflush
 
 mov eax, 1
 mov ebx, 0
 int 0x80
