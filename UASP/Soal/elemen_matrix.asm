extern scanf
extern printf
extern fflush
 
section .data
     
    cetak db "%d", 10,0
    fmt db "%d %d",0
    arr dd 7, 11, 10, 6
        dd 5, 8, 9, 2
        dd 1, 3, 12, 4
           
section .bss
    num1 resd 1
    num2 resd 1
   
segment .text
    global main
   
main:
    push num2
    push num1
    push fmt
    call scanf
    add esp, 12
     
    mov eax,[num1]
    mov ecx,16
    mul ecx
    
    mov ebx,eax
    mov eax,[num2]
    mov ecx,4
    mul ecx
    
    add eax,ebx
     
    push dword[arr+eax]
    push cetak
    call printf
    add esp, 8
 
exit:
    push 0
    call fflush
       
    mov eax,1
    mov ebx,0
    int 0x80
