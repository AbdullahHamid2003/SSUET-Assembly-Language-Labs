TITLE LAB 5 ACTIVITY 2   ;title
.model small       ;allocates the memory
.stack 100h        ;stack memory reserves 100 bytes

.Data              ;intializes the data segment 
    msg db 'The all 256 characters are: $'
    continue db 'press any key to continue... $'

.code              ;intializes the code segment 

abdullah proc      ;main procedure starts
    
    mov ax,@data   ;initializing the data segment
    mov ds,ax
    
    lea dx,msg     ;Displays the message given in the string 'msg'
    mov ah,9       ;funtion to display string
    int 21h        ;invoke the interrupt
    
    mov cx,23      ;setting the counter to 23
    
    mov ah,2       ;function for a single character 
    mov dl,0       ;ASCII code of NULL          
    
loop:
    int 21h        ;invoke the interrupt 
    
    INC dl         ;increament dl
    DEC cx         ;decreament cx
    
    jnz loop       ;jump to label loop untill cx becomes 0
    
    mov ah,2h      ;calling funtion 2
    mov dl,0ah     ;line feed
    int 21h        ;invoke the interrupt 
    mov dl,0dh     ;carriage return(brings the cursor to the left)
    int 21h        ;invoke the interrupt 
    
    lea dx,continue  ;Displays the message given in the string 'cont.'
    mov ah,9         ;funtion to display string
    int 21h          ;invoke the interrupt
    
    mov ah,1       ;funtion to input a single character
    int 21h        ;invoke the interrupt
    
    mov AX,0600h   ;scroll the entire screen
    mov BH,7       ;normal attribute
    mov CX,0h      ;starts at 0000
    mov DX,184Fh   ;ends at 18 4F
    int 10h        ;invoke the interrupt
    
    mov cx,23      ;setting the counter to 23
    
    mov ah,2       ;function for a single character 
    mov dl,17h     ;ASCII code of NULL          
    
loop2:
    int 21h        ;invoke the interrupt 
    
    INC dl         ;increament dl
    DEC cx         ;decreament cx
    
    jnz loop2      ;jump to label loop2 untill cx becomes 0
    
    mov ah,2h      ;calling funtion 2
    mov dl,0ah     ;line feed
    int 21h        ;invoke the interrupt 
    mov dl,0dh     ;carriage return(brings the cursor to the left)
    int 21h        ;invoke the interrupt 
    
    lea dx,continue  ;Displays the message given in the string 'cont.'
    mov ah,9         ;funtion to display string
    int 21h          ;invoke the interrupt
    
    mov ah,1       ;funtion to input a single character
    int 21h        ;invoke the interrupt
    
    mov AX,0600h   ;scroll the entire screen
    mov BH,7       ;normal attribute
    mov CX,0h      ;starts at 0000
    mov DX,184Fh   ;ends at 18 4F
    int 10h        ;invoke the interrupt 
    
    mov cx,23     ;setting the counter to 23
    
    mov ah,2       ;function for a single character 
    mov dl,2Dh     ;ASCII code of NULL          
    
loop3:
    int 21h        ;invoke the interrupt 
    
    INC dl         ;increament dl
    DEC cx         ;decreament cx
    
    jnz loop3      ;jump to label loop3 untill cx becomes 0
    
    mov ah,2h      ;calling funtion 2
    mov dl,0ah     ;line feed
    int 21h        ;invoke the interrupt 
    mov dl,0dh     ;carriage return(brings the cursor to the left)
    int 21h        ;invoke the interrupt 
    
    lea dx,continue  ;Displays the message given in the string 'cont.'
    mov ah,9         ;funtion to display string
    int 21h          ;invoke the interrupt
    
    mov ah,1       ;funtion to input a single character
    int 21h        ;invoke the interrupt
    
    mov AX,0600h   ;scroll the entire screen
    mov BH,7       ;normal attribute
    mov CX,0h      ;starts at 0000
    mov DX,184Fh   ;ends at 18 4F
    int 10h        ;invoke the interrupt 
    
    mov cx,23      ;setting the counter to 23
    
    mov ah,2       ;function for a single character 
    mov dl,45h     ;ASCII code of NULL          
    
loop4:
    int 21h        ;invoke the interrupt 
    
    INC dl         ;increament dl
    DEC cx         ;decreament cx
    
    jnz loop4      ;jump to label loop4 untill cx becomes 0
    
    mov ah,2h      ;calling funtion 2
    mov dl,0ah     ;line feed
    int 21h        ;invoke the interrupt 
    mov dl,0dh     ;carriage return(brings the cursor to the left)
    int 21h        ;invoke the interrupt 
    
    lea dx,continue  ;Displays the message given in the string 'cont.'
    mov ah,9         ;funtion to display string
    int 21h          ;invoke the interrupt
    
    mov ah,1       ;funtion to input a single character
    int 21h        ;invoke the interrupt
    
    mov AX,0600h   ;scroll the entire screen
    mov BH,7       ;normal attribute
    mov CX,0h      ;starts at 0000
    mov DX,184Fh   ;ends at 18 4F
    int 10h        ;invoke the interrupt 

    mov cx,23      ;setting the counter to 23
    
    mov ah,2       ;function for a single character 
    mov dl,5ch     ;ASCII code of NULL          
    
loop5:
    int 21h        ;invoke the interrupt 
    
    INC dl         ;increament dl
    DEC cx         ;decreament cx
    
    jnz loop5      ;jump to label loop5 untill cx becomes 0
    
    mov ah,2h      ;calling funtion 2
    mov dl,0ah     ;line feed
    int 21h        ;invoke the interrupt 
    mov dl,0dh     ;carriage return(brings the cursor to the left)
    int 21h        ;invoke the interrupt 
    
    lea dx,continue  ;Displays the message given in the string 'cont.'
    mov ah,9         ;funtion to display string
    int 21h          ;invoke the interrupt
    
    mov ah,1       ;funtion to input a single character
    int 21h        ;invoke the interrupt
    
    mov AX,0600h   ;scroll the entire screen
    mov BH,7       ;normal attribute
    mov CX,0h      ;starts at 0000
    mov DX,184Fh   ;ends at 18 4F
    int 10h        ;invoke the interrupt 

    mov cx,23      ;setting the counter to 23
    
    mov ah,2       ;function for a single character 
    mov dl,74h     ;ASCII code of NULL          
    
loop6:
    int 21h        ;invoke the interrupt 
    
    INC dl         ;increament dl
    DEC cx         ;decreament cx
    
    jnz loop6      ;jump to label loop6 untill cx becomes 0
    
    mov ah,2h      ;calling funtion 2
    mov dl,0ah     ;line feed
    int 21h        ;invoke the interrupt 
    mov dl,0dh     ;carriage return(brings the cursor to the left)
    int 21h        ;invoke the interrupt 
    
    lea dx,continue  ;Displays the message given in the string 'cont.'
    mov ah,9         ;funtion to display string
    int 21h          ;invoke the interrupt
    
    mov ah,1       ;funtion to input a single character
    int 21h        ;invoke the interrupt
    
    mov AX,0600h   ;scroll the entire screen
    mov BH,7       ;normal attribute
    mov CX,0h      ;starts at 0000
    mov DX,184Fh   ;ends at 18 4F
    int 10h        ;invoke the interrupt 

    mov cx,23      ;setting the counter to 23
    
    mov ah,2       ;function for a single character 
    mov dl,8bh     ;ASCII code of NULL          
    
loop7:
    int 21h        ;invoke the interrupt 
    
    INC dl         ;increament dl
    DEC cx         ;decreament cx
    
    jnz loop7      ;jump to label loop7 untill cx becomes 0
    
    mov ah,2h      ;calling funtion 2
    mov dl,0ah     ;line feed
    int 21h        ;invoke the interrupt 
    mov dl,0dh     ;carriage return(brings the cursor to the left)
    int 21h        ;invoke the interrupt 
    
    lea dx,continue  ;Displays the message given in the string 'cont.'
    mov ah,9         ;funtion to display string
    int 21h          ;invoke the interrupt
    
    mov ah,1       ;funtion to input a single character
    int 21h        ;invoke the interrupt
    
    mov AX,0600h   ;scroll the entire screen
    mov BH,7       ;normal attribute
    mov CX,0h      ;starts at 0000
    mov DX,184Fh   ;ends at 18 4F
    int 10h        ;invoke the interrupt 
    
    mov ah,4ch     ;A funtion to return the control to the OS
    int 21h        ;invoking the interrupt
    
    abdullah endp  ;Ends the main procedure
end abdullah  

