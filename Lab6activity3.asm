Title lab 6 activity 3 ;title
.model small       ;allocates the memory
.stack 100h        ;stack meory reserves 100 bytes
.code              ;intializes the code segment 

abdullah proc      ;starts the main procedure
    
    mov cx,7       ;setting the counter at 7
    
outer:             ;outer loop
    push cx        ;pushes the ,contents of cx into stack
    
    mov dl,31h     ;moving the hex equalent of 1 in dl
    
inner:             ;inner loop
    mov ah,2       ;calling funtion 2
    int 21h        ;invokes the interrupt
    
    inc dl         ;increamenting dl
    
    loop inner     ;running the loop(also decreaments CX)
    
    mov ah,2       ;calling funtion 2
    mov dl,0ah     ;line feed
    int 21h        ;invokes the interrupt
    mov dl,0dh     ;carriage return
    int 21h        ;invokes the interrupt
                   
    pop cx         ;retrievs the contents of CX
    
    loop outer     ;running the loop
    
    mov ah,4ch     ;A funtion to return the control to OS
    int 21h        ;invokes the interrupt
                   
    abdullah endp  ;ends the main procedure
end abdullah                                  

