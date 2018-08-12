extern scanf
extern printf
extern fflush
 
section .data
     
    cetak db "%d", 10,0
    fmt db "%d",0
    arr dd 7, 11, 10, 6
        dd 5, 8, 9, 2
        dd 1, 3, 12, 4
           
section .bss
    num1 resd 1
   
segment .text
    global main
   
main:
    push num1
    push fmt
    call scanf
    add esp, 12
     
    mov eax,[num1]
    mov ecx,16
    mul ecx
     
    mov ebx,dword[arr+eax]
    add ebx,dword[arr+eax+4]
    add ebx,dword[arr+eax+8]
    add ebx,dword[arr+eax+12]
     
    push ebx
    push cetak
    call printf
    add esp, 8
 
exit:
    push 0
    call fflush
       
    mov eax,1
    mov ebx,0
    int 0x80
