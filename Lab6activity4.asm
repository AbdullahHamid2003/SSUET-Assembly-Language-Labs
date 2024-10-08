Title lab 6 activity 2   ;title
.model small       ;allocates the memory
.stack 100h        ;stack meory reserves 100 bytes
.code              ;intializes the code segment 

abdullah proc      ;starts the main procedure
    
    mov cx,5       ;setting the counter at 5
    
    mov ah,2       ;calling funtion 2
    mov dl,31h     ;moving the hex equalent of 1 in dl
    
    loop1:         ;label
    
    int 21h        ;invokes the interrrupt
    inc dl         ;increamenting dl
    
    loop loop1     ;running the loop1
    
    mov ah,2       ;calling funtion 2
    mov dx,0101h   ;setting the cursor at these row & column positions
    int 10h        ;invokes the interrrupt
    mov dl,32h     ;moving the hex equalent of 2 in dl
    
    mov cx,3       ;setting the counter at 3
    
    loop2:         ;label
   
    int 21h        ;invokes the interrrupt
    inc dl         ;increamenting dl
    
    loop loop2     ;running the loop2
    
    mov ah,2
    mov dx,0202h   ;setting the cursor at these row & column positions
    int 10h        ;invokes the interrrupt
    
    mov dl,33h     ;moving the hex equalent of 3 in dl
    int 21h        ;invokes the interrrupt
    
    mov ah,2
    mov dx,0301h   ;setting the cursor at these row & column positions
    int 10h        ;invokes the interrrupt
    mov dl,34h     ;moving the hex equalent of 4 in dl
    
    mov cx,3       ;setting the counter at 3
    
    loop3:         ;label
    
    int 21h        ;invokes the interrrupt
    dec dl         ;decreamenting dl
    
    loop loop3     ;running the loop3
    
    mov ah,2
    mov dx,0400h   ;setting the cursor at these row & column positions
    int 10h        ;invokes the interrrupt
    
    mov dl,35h     ;moving the hex equalent of 5 in dl
    
    mov cx,5       ;setting the counter at 5
    
    loop4:         ;label
    
    int 21h        ;invokes the interrrupt
    dec dl         ;decreamenting dl
    
    loop loop4     ;running the loop4
    
    mov ah,4ch     ;A funtion to return the control to OS
    int 21h        ;invokes the interrupt
    
    abdullah endp  ;ends the main procedure
end abdullah                                                                                             