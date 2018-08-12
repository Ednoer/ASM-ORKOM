extern scanf
extern printf
extern fflush
 
section .data
    fmt1 db "%d", 0
    fmt2 db "%s", 10, 0
    satu db "pemuda", 0
    dua db "dewasa", 0
    tiga db "lanjut", 0
     
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
    
    cmp eax, 64
    ja lanjut
    
    cmp eax, 40
    ja dewasa
    
    cmp eax, 0
    ja pemuda
     
   
     
pemuda:
    push satu
    push fmt2
    call printf
    add esp, 8
     
    jmp exit
     
dewasa:
    push dua
    push fmt2
    call printf
    add esp, 8
     
    jmp exit
     
lanjut:
    push tiga
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
