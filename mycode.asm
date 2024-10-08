;write a program to input a single character and covert it into uppercase 

.model small       ;allocates the memory
.stack 100h        ;stack memory reserves 100 bytes
.Data              ;intializes the data segment 

msg db 'Enter a single character: $'

.code              ;intializes the code segment 

abdullah proc      ;main procedure starts
    mov ax,@data
    mov ds,ax      ;initializes the data segment 
    
    lea dx,msg     ;prints the string 
    mov ah,9
    int 21h        ;invokes the interrupt
    
    mov ah,1       ;funtion 1 for input a single character
    int 21h
    
    mov ah,2       ;funtion for line feed and carriage return
    mov dl,0ah
    int 21h        ;invokes the interrupt
    mov dl,0dh
    int 21h        ;invokes the interrupt
   
    mov [si],al
    mov dl,[si]    ;Moving content of SI to DL   
    sub dl,20h     ;Subracting 32 to make uppercase
    mov ah,2       ;Calling function 2
    int 21h        ;Invoking interupt 21h
    
    mov ah,4ch     ;exit to dos
    int 21h        ;invokes the interrupt
    
    abdullah endp  ;Ends the main procedure
end abdullah  
