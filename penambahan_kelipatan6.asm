extern printf
extern scanf
extern fflush
section .data                    
    fmt1 db "%d", 0        
    fmt2 db "%d", 10, 0            
 
section .bss                       
    bil  resd 1                 
   
section .text
    global main
       
main :
    push bil               
    push fmt1
    call scanf
    add esp, 8
   
	mov edx, 0
	mov eax, [bil]
	mov ebx, 6
	div ebx
	mul ebx
	
	mov ebx, eax
ulang:
	sub ebx, 6
	add eax, ebx
	cmp ebx, edx
	LOOPNE ulang
	
        
    push eax
    push fmt2
    call printf
    add esp,8
     
     
    push 0
    call fflush
exit:
    mov eax, 1
    mov ebx, 0 
    int 0x80
