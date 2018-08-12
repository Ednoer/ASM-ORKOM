extern scanf
extern printf
extern fflush
  
section .data
      
    cetak    db "%d", 10,0
    fmt db "%d %d",0
    
          
section .bss
    num1 resd 1
    num2 resd 1
    
segment .text
    global main
    
main:
    push num1
    push num2
    push fmt
    call scanf
    add esp, 8
     
    mov ecx,[num1]
    cmp ecx,0
    je exit

    mov eax,1
    mov ebx,[num2]
  
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
