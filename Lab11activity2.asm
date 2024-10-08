Title lab 11 activity 2   ;title
.model small    ;allocates the memory to code
.stack 100h     ;reserves 100 bytes
.data

msg1 db 'Enter the Password: $'
msg2 db 0ah,0dh, 'Enter it Again: $'
msg3 db 0ah,0dh, 'Congratulation! Your password has been matched $'
msg4 db 0ah,0dh, 'Alas! You have failed to enter the correct password $'
password db 50 dup ('$')
pass_len db 0h
cmp_password db 50 dup ('$')
cmp_pass_len db 0h

.code                ;code segment initializes

Abdullah proc        ;main proc starts
      mov ax,@data   ;initializes the data segment 
      mov ds,ax 
      mov es,ax      ;intializes the extra segment 
      
      CLD            ;clears the direction flag
      mov ah,9       ;calling funtion 9
      lea bx,msg1    ;stores all values in bx
      int 21h        ;invokes the interrupt
      
      mov cx,2        ;cx set to 0
      lea si,password ;maintain the password
      lea di,pass_len ;maintain the password lenght
      
      Input:          ;label field
      mov ah,7        ;calling funtion 7
      int 21h         ;invokes the interrupt
      cmp al,13       ;comparing al with hex equilet of ENTER
      JE next1        ;if matches then jump to next1
      mov [si],al     ;moving the contents of al to memory address of si
      inc si          ;increament si 
      add [di],1      ;adding 1 to the contents of di 
      
      mov ah,2        ;calling funtion 2
      mov dl,'*'      ;moving * in dl
      int 21h         ;invokes the interrupt
      jmp input       ;unconditional jump to input
      
      next1:          ;label field
      dec cx          ;decreament cx (cx becomes 1)
      jz next2        ;jump to next2 if zero
      
      mov ah,9        ;calling funtion 9
      lea dx,msg2     ;print msg2
      int 21h         ;invokes the interrupt
      
      lea si,cmp_password ;moving the offset of cmp_password to SI
      lea di,cmp_pass_len ;moving the offset of cmp_pass_len to DI
      jmp input           ;unconditional jump to input 
      
      next2:          ;label field
      call compare    ;calling compare procedure
      
      mov ah,4ch      ;exit to DOS
      int 21h         ;invokes the interrupt
      
      Abdullah endp   ;Ends main proc

compare proc          ;initializes compare procedure
    
    mov al,pass_len     ;moving the lenght of password in al
    cmp al,cmp_pass_len ;comparing both the strings
    jnz false           ;ig not match then jump to false
    
    mov cl,pass_len     ;moving the lenght of password in cl
    
    lea si,password     ;moving the offset of password in si
    lea di,cmp_password ;moving the offset of cmp_pass in di
    
    repe cmpsb          ;repeat compare string byte
    
    jnz false           ;if not match then jump to false
    jmp true            ;if matched then jump to true
    
    false:              ;label field
    mov ah,9            ;calling funtion 9
    lea dx,msg4         ;print msg4
    int 21h             ;invokes the interrupt
    jmp exit            ;uncondition jump to exit
    
    true:               ;label field
    mov ah,9            ;calling funtion 9
    lea dx,msg3         ;print msg3
    int 21h             ;invokes the interrupt
    
    exit:               ;label field
    ret                 ;return to main
    compare endp        ;compare procedure ends
end Abdullah
         
    Abdullah endp       ;main procedure ends
end Abdullah