TITLE LAB 9 ACTIVITY 1
.model small       ;allocates the memory to code
.stack 100h       ;reserves 256 bytes 
.data
input db 'Enter four digit number: $'
dig1 db ?
dig2 db ?
dig3 db ?
dig4 db ?   

.code
Abdullah proc
    mov ax,@data   ;initializes the data segment 
    mov ds,ax
    
    mov bx,00h     ;set bx to 00  
    
    mov dx,offset input   ;print string
    mov ah,9              ;calling function 9
    int 21h               ;invokes the interrupt 
    
    mov ah,1              ;input the single numbeer
    int 21h               ;invokes the interrupt 
    mov dig1,al           ;stores 1st number in DIG1
    
    mov ah,1              ;input the single numbeer
    int 21h               ;invokes the interrupt 
    mov dig2,al           ;stores 2nd number in DIG2
    
    mov ah,1              ;input the single numbeer
    int 21h               ;invokes the interrupt 
    mov dig3,al           ;stores 3rd number in DIG3
    
    mov ah,1              ;input the single numbeer
    int 21h               ;invokes the interrupt 
    mov dig4,al           ;stores 4th number in DIG4  
    
    mov al,dig1           ;stores 1st number in al
    mov cx,4              ;set cx to 4    
    SBACK1:
    ROR al,1              ;apply for instruction in al
    jc Count1             ;jump to count if carry    
    LBACK1:
    loop SBACK1           ;end of loop till cx become 0
    jmp next1             ;jump to next    
    count1:
    inc bx                ;increament bx
    jmp LBACK1            ;jump to Lback
    
    next1:
    mov al,dig2           ;stores 2nd number in al
    mov cx,4              ;set cx to 4 
    SBACK2:
    ROR al,1              ;apply for instruction in al
    jc Count2             ;jump to count if carry    
    LBACK2:
    loop SBACK2           ;end of loop till cx become 0
    jmp next2             ;jump to next    
    count2:
    inc bx                ;increament bx
    jmp LBACK2            ;jump to Lback       
    
    next2:
    mov al,dig3           ;stores 3rd number in al
    mov cx,4              ;set cx to 4 
    SBACK3:
    ROR al,1              ;apply for instruction in al
    jc Count3             ;jump to count if carry    
    LBACK3:
    loop SBACK3           ;end of loop till cx become 0
    jmp next3             ;jump to next    
    count3:
    inc bx                ;increament bx
    jmp LBACK3            ;jump to Lback 
    
    next3:
    mov al,dig4           ;stores 4th number in al
    mov cx,4              ;set cx to 4 
    SBACK4:
    ROR al,1              ;apply for instruction in al
    jc Count4             ;jump to count if carry    
    LBACK4:
    loop SBACK4           ;end of loop till cx become 0
    jmp GO                ;jump to next    
    count4:
    inc bx                ;increament bx
    jmp LBACK4            ;jump to Lback      
    
    ;converting into upacked BCD
    GO:
    mov al,bl             ;moving the cotents of bl into al
    mov dl,01h            ;moving 1 into dl
    mul dl                ;multiplying dl with al
    AAM                   ;ASCII ADJUST FOR MULTIPLICATION
    OR ax,3030h           ;Adding 3030 into AX
    mov bx,ax             ;moving ax into bx
    
    ;Displaying BCD values
    mov ah,2              ;calling funtion 2
    mov dl,0Dh            ;carraige return
    int 21h               ;invokes the interrupt
    mov dl,0Ah            ;line feed
    int 21h               ;invokes the interrupt
    
    mov ah,2              ;calling funtion 2
    mov dl,bh             ;moving bh into dl
    int 21h               ;invokes the interrupt
    
    mov ah,2              ;calling funtion 2
    mov dl,bl             ;moving bh into dl
    int 21h               ;invokes the interrupt
    
    mov ah,4ch            ;exit to dos
    int 21h               ;invokes the interrupt
    
    Abdullah endp         ;ending of main procedure
    end Abdullah
    