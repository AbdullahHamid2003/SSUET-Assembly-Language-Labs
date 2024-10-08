TITLE LAB 9 ACTIVITY 3

.model small       ;allocates the memory to code
.stack 100h       ;reserves 256 bytes 
.data
string db 'COUNTER from 0 to 9:'  ,0dh,0ah ,'$' 
.code                                 

Abdullah proc  
                    
    mov ax,@data      ;initializes the data segment 
    mov ds,ax
    
    mov dx,offset string   ;print string
    mov ah,9               ;calling funtion 9
    int 21h                ;invokes the interrupt
    
    mov bl,0h         ;set bl to 00
    
    Again:
    mov dl,1          ;moving 1 in dl
    mov al,bl         ;moving bl into al
    
    ;covert in BCD
    mul  dl           ;multiplying dl with al
    AAM               ;ASCII ADJUST FOR MULTIPLICATION
    OR ax,3030h       ;Adding 3030 in ax
    mov cx,ax         ;moving the contents of ax into cx
    
    ;Display
    mov ah,2          ;callig funtion 2
    mov dl,ch
    int 21h           ;invokes the interrupt
    mov dl,cl
    int 21h           ;invokes the interrupt
    
    mov ah,2          ;callig funtion 2
    mov dl,0Dh        ;carriage return
    int 21h           ;invokes the interrupt
    mov dl,0Ah        ;line feed
    int 21h           ;invokes the interrupt
    
    inc bl            ;increamenting bl
    cmp bl,10         ;comparing bl with 10
    JNE Again         ;jump if not equal=10 to again
    
    mov ah,4ch        ;exit to dos
    int 21h           ;invokes the interrupt
    
    Abdullah endp     ;ending of main procedure
    end Abdullah