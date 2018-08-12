extern printf
extern fflush
extern scanf
   
section .data
    scan db  "%s %s", 0
    print db "%d", 10,0
    no db "tidak ada", 10,0
   
section .bss
    input resb 51
    banding resb 51
       
section .text
    global main
       
main:
    push banding
    push input
    push scan
    call scanf
    add esp, 8
     
    mov edi, input
    mov al, [banding]
     
    mov ecx, 50
    repne scasb
     
    cmp ecx, 0
    jne cetak ;tidak sama dengan
     
    push no
    call printf
    add esp, 8
    jmp exit
     
cetak:
    mov eax, 50
    sub eax, ecx
    push eax
    push print
    call printf
    add esp, 8
    jmp exit
       
exit: 
    push 0
    call fflush
       
    mov eax,1
    mov ebx,0
    int 0x80
