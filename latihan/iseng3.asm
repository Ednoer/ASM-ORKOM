extern scanf
extern printf
extern fflush
 
section .data
    fmt1 db "%d", 0
    fmt2 db "%d", 10, 0
     
     
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
    mov ebx, 0
    mov ecx, 7
     
looping:
    add ebx, ecx
    add ecx, 7
     
    cmp ecx, eax
    jbe looping
     
    push ebx
    push fmt2
    call printf
    add esp, 8
     
    push 0
    call fflush
     
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
