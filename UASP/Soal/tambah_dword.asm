extern scanf
extern printf
extern fflush
   
section .data
       
    cetak db "%d", 10,0
    fmt db "%d %d",0
    dword_size equ 4
           
section .bss
    a resd 1
    b resd 1
    
segment .text
    global main
     
main:
    push a
    push b
    push fmt
    call scanf
    add esp,12
     
    push dword [b]
    push dword [a]
    call tambah
     
    jmp exit
 
tambah:
    push ebp
    mov ebp,esp
    mov eax,[ebp+3*dword_size]
    add eax,[ebp+2*dword_size]
    pop ebp
    ret 2*dword_size
     
exit:
    push eax
    push cetak
    call printf
    add esp,8
    push 0
    call fflush
         
    mov eax,1
    mov ebx,0
    int 0x80
