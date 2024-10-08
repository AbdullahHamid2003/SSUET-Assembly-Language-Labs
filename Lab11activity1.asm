TITLE LAB 11 ACTIVITY 1
.model small       ;allocates the memory to code
.stack 100h       ;reserves 256 bytes 
.data       
MSG db 'Enter String: $'
Count db 0Dh,0Ah,'Count of string: $'
.code                                 
Abdullah proc         ;starting the main procedure.                    
    mov ax,@data      ;initializes the data segment 
    mov ds,ax
    
    mov bx,0          ;moving 0 into bx
    Lea dx,MSG        ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt
    
    L1:
    mov ah,1          ;input a single character
    int 21h           ;invokes the interrupt
    cmp al,13         ;Compare Al with ENTER
    je JUMP           ;Jump if equal to JUMP
    
    mov [si],al       ;store al contents to the address of SI
    inc si            ;increamenting si
    inc bx            ;increamenting bx
    jmp L1            ;jump to L1
    
    JUMP:             ;label field
    Lea dx,Count      ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt       
 
    mov ax,bx         ;moving the contents of bx into ax    
    AAM               ;ASCII ADJUST FOR MULTIPLICATION
    or ax,3030h       ;ADDING 3030 IN AX
    mov bx,ax         ;moving the contents of ax into bx
    
    mov ah,2          ;calling funtion 2
    mov dl,bh         ;moving the contents of bh into dl
    int 21h           ;invokes the interrupt
    mov dl,bl         ;moving the contents of bl into dl
    int 21h           ;invokes the interrupt
    
    mov ah,4ch        ;exit to dos
    int 21h           ;invokes the interrupt
    
    Abdullah endp     ;main procedure ends
end Abdullah