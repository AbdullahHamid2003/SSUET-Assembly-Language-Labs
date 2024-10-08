Title lab 11 activity 3   ;title
.model small    ;allocates the memory to code
.stack 100h     ;reserves 100 bytes
.data

val db 5,7,11,17,25,35,47,61,77,95

.code                ;code segment initializes

Abdullah proc        ;main proc starts
      mov ax,@data   ;initializes th edata segment 
      mov ds,ax 
      
      lea bx,val     ;stores all values in bx
      mov al,7       ;print the 3rd value from lookup table 
      xlat           ;used to translate a byte in Al using a table in the memory
      
      aam            ;ASCII ADJUST FOR MULTIPLICATION
      or ax,3030h    ;ADDING 3030H IN AX (for 2 digit)
      mov bx,ax      ;moving the contents of ax in bx
      
      mov ah,2       ;calling funtion 2
      mov dl,bh      ;moving the contents of bh in dl
      int 21h        ;invokes the interrupt
            
      mov ah,2       ;calling funtion 2
      mov dl,bl      ;moving the contents of bl in dl
      int 21h        ;invokes the interrupt
      
      mov ah,4ch     ;Exit to DOS
      int 21h        ;invokes the interrupt
      
    Abdullah endp    ;main procedure ends
end Abdullah