TITLE LAB 5 ACTIVITY 3   ;title
.model small       ;allocates the memory
.stack 100h        ;stack memory reserves 100 bytes

.code              ;intializes the code segment 

abdullah proc      ;main procedure starts
    
    mov ah,2       ;setting the cusrsor option
    mov bh,0       ;page 0
    mov dx,0a23h   ;row position (0A), column position (23)
    int 10h        ;invoke the interrupt
    
    mov ah,2       ;calling funtion 2
    mov dl,'*'     ;giving input '*' in DL
    mov bx,9       ;moving 9 into BX to print '*' 9 times
    
loop:
    int 21h        ;invoke the interrupt
    dec bx         ;decreaminting bx
       
    jnz loop       ;jumping to loop till bx becomes 0
       
    mov ah,2       ;setting the cusrsor option
    mov bh,0       ;page 0
    mov dx,0527h   ;row position (05), column position (27)
    int 10h        ;invoke the interrupt
    
    mov ah,2       ;calling funtion 2
    mov dl,'*'     ;giving input '*' in DL
    mov bx,10       ;moving 10 into BX to print '*' 10 times
    
loop2:             
    int 21h        ;invoke the interrupt
    dec bx         ;decreaminting bx
    push dx        ;copies the value onto the top of the stack
    
    mov ah,2       ;calling funtion 2
    mov dl,0ah     ;line feed
    int 21h        ;invoke the interrupt
    mov dl,08h     ;carriage returns(brings the cursor to the left)
    int 21h        ;invoke the interrupt
    int 21h        ;invoke the interrupt
    
    pop dx         ;retrieves the value from the top of the stack
    
    jnz loop2      ;jumping to loop2 untill bx becomes 0
    
     mov ah,2      ;setting the cusrsor option
    mov bh,0       ;page 0
    mov dx,0527h   ;row position (05), column position (27)
    int 10h        ;invoke the interrupt 
    
     mov ah,2      ;calling funtion 2
    mov dl,'*'     ;giving input '*' in DL
    mov bx,10      ;moving 10 into BX to print '*' 10 times
    
loop3:
    int 21h        ;invoke the interrupt
    dec bx         ;decreaminting bx
    push dx        ;copies the value onto the top of the stack
    
    mov ah,2       ;calling funtion 2
    mov dl,0ah     ;line feed
    int 21h        ;invoke the interrupt
  
    pop dx         ;retrieves the value from the top of the stack
    
    jnz loop3      ;jumping to loop3 untill bx becomes 0
   
    mov ah,4ch     ;A funtion to return the control to the OS
    int 21h        ;invoking the interrupt
    
    abdullah endp  ;Ends the main procedure
end abdullah  
      
