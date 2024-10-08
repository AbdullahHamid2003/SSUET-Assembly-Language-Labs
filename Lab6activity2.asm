.model small     ; Allocating memory to code
.stack 100h      ; stack memory reserved 100 bytes

.code            ;intializes the code segment

Abdullah proc    ;Starting of main procedure  
    
 mov cx,9        ;Initializing CX
 
 mov ah,2        ;Calling function 2  
 mov dl,31h      ;passing character "1" in DX
 
loop1:
 
 int 21h         ;Invoking interupt 21h
 
 mov bx,09fh    ;counter set to 09ffh (60 seconds)
 
loop2: 

 NOP             ;NOP does not implement any operation
 dec bx          ;Decrementing BX
 
 jnz loop2       ;If BX is not = 0 jump back to Loop2   
 
 inc dl          ;Incrementing DL
 push dx         ;Storing DX into stack
 
 mov ah,2        ;Calling function 2
 mov dl,08h      ;08H is ASCII for back space
 int 21h         ;Invoking interupt 21h
 
 pop dx          ;Retrieing DX
 
 dec cx          ;Decrementing CX
 jnz loop1       ;If CX is not = 0 jump back to Loop2
      
 mov ah, 4ch     ;Transfer controls to OS using fuction 4ch
 int 21h         ;Invoking interupt 21h
           
Abdullah endp    ;Ends the main procedure
end Abdullah   

