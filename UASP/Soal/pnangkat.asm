extern scanf
extern printf
extern fflush
  
section .data
      
    cetak db "%d", 10,0
    fmt db "%d",0
             
section .bss
    a resd 1
    b resd 1
     
segment .text
    global main
     
main:
    push a
    push fmt
    call scanf
    add esp, 12
     
    mov edx,[a]
    cmp edx,0
    je exit
     
    push b
    push fmt
    call scanf
    add esp, 12
 
    mov ecx,[b]
    mov eax,1
    mov ebx,[a]
LP:
    mul ebx
    LOOPNE LP
     
    push eax
    push cetak
    call printf
    add esp,8
    jmp main
     
exit:
    push 0
    call fflush
        
    mov eax,1
    mov ebx,0
    int 0x80
