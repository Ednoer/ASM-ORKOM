;M FADHLI Z
;G64150011

extern printf
extern scanf
extern fflush
section .data                       
    fmt1 	db "%d", 0                   
	lambat 	db "lambat", 10, 0
	sedang 	db "sedang", 10, 0
	tilang 	db "tilang", 10, 0

	
section .bss                        
    kecepatan  resd 1                 
   
section .text
    global main
       
main :
    push kecepatan                        
    push fmt1
    call scanf
    add esp, 8
   
    mov eax, [kecepatan]
    cmp eax, 60
    JAE hayolo
    cmp eax, 30
    JAE awas
    cmp eax, 1
    JAE yooii
    
    push 0
    call fflush
    jmp exit
 
 yooii:
	push eax
    push lambat
    call printf
    add esp, 8
    
    push 0
    call fflush
    jmp exit
 
 hayolo:
	push eax
    push tilang
    call printf
    add esp, 8
    
    push 0
    call fflush
    jmp exit
 
 awas:
    push eax
    push sedang
    call printf
    add esp, 8
     
    push 0
    call fflush

exit:
    mov eax, 1
    mov ebx, 0 
    int 0x80
