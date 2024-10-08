TITLE LAB 10 ACTIVITY 2  ;title
.model small             ;allocates the memory to code
.stack 100h              ;reserves 100 bytes
.data
STR db 'Press any number to print its table: $'   
DIG db ?
.code

Abdullah proc        ;main procedure starts
    mov ax,@data     ;initializes the data segment 
    mov ds,ax
    
    call CLRSCR      ;calling clear screen funtion
    call SETCRSR     ;calling SET_CURSOR funtion
    call DISPTBL     ;calling DISPLAY_TABLE funtion
    
    mov ah,4ch       ;exit to DOS                
    int 21h          ;invokes the interrupt
    
    abdullah endp    ;main proc ends

CLRSCR PROC          ;procedure starts
    mov ax,0600h     ;set of instruction for clear screen
    mov bh,07
    mov cx,0000
    mov dx,184fh
    int 10h          ;invokes the interrupt
    ret
    CLRSCR endp      ;CLRSCR procedure ends

SETCRSR proc         ;procedure starts
    mov ah,02        ;calling funtion 2
    mov bh,00        ;page 0
    mov dx,0100h     ;row = 1, column = 0
    int 10h          ;invokes the interrupt
    ret
    SETCRSR endp     ;SETCRSR procedure ends

DISPTBL proc         ;procedure starts
    mov ax,0         ;ax set to 0
    mov bx,0         ;bx set to 0
    mov cx,0         ;cx set to 0
    mov dx,0         ;dx set to 0
    
    lea dx, str      ;moving offset of str into dx
    mov ah,9         ;callig funtion 9
    int 21h          ;invokes the interrupt
    
    mov ah,1         ;funtion 1 for input a single character
    int 21h          ;invokes the interrupt
    and al,0fh       ;multiplying al  with 0f
    mov DIG,al       ;moving the contents of al into DIG
    
    mov cx,10        ;cx set to 10
    mov dh,1         ;moving 1 into dh
    
    AGAIN:           ;again label field
    mov ah,2         ;calling funtion 2
    mov dl,0ah       ;line feed
    int 21h          ;invokes the interrupt
    mov dl,0dh       ;carriage return
    int 21h          ;invokes the interrupt
    
    mov al,DIG       ;again mov DIG  in al
    or al,30h        ;adding 30 in al               
    
    mov bl,al        ;moving the contents of al in bl
    mov ah,2         ;calling funtion 2
    mov dl,bl        ;moving the contetns of bl in dl
    
    int 21h          ;invokes the interrupt
    
    mov dl,'*'       ;moving * in dl 
    int 21h          ;invokes the interrupt
                     
    mov al,dh        ;moving the contents of dh in al
    AAM              ;ASCII AJDUST FOR MULTIPLICATION
    or ax,3030h      ;Adding 3030 in ax (for 2 digit)
    mov bx,ax        ;moving the contents of ax in bx
    mov ah,2         ;calling funtion 2
    mov dl,bh        ;moving the contents of bh in dl
    int 21h          ;invokes the interrupt
    mov dl,bl        ;moving the contents of bl in dl
    int 21h          ;invokes the interrupt
    
    mov dl,'='       ;moving euals to(=) in dl 
    int 21h          ;invokes the interrupt
    
    mov al,DIG       ;moving the contents of DIG in al
    mul dh           ;multiplying dh with al
    AAM              ;ASCII ADJUST FOR MULTIPLICATION
    or ax,3030h      ;Adding 3030 in ax
    mov bx,ax        ;moving the contents of ax in bx
    
    mov ah,2         ;calling funtion 2
    mov dl,bh        ;moving the contents of bh in dl
    int 21h          ;invokes the interrupt
    mov dl,bl        ;moving the contents of bl in dl
    int 21h          ;invokes the interrupt
    inc dh           ;increamenting dh
    loop again       ;loop run until cx becomes 0
    
    ret              ;return command 
    DISPTBL ENDP     ;DISPTBL procedure ends
    
    end Abdullah     ;main procedure ends