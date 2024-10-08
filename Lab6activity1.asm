TITLE LAB 6 ACTIVITY 1   ;title
.model small       ;allocates the memory
.stack 100h        ;stack memory reserves 100 bytes
.data              ;initializes data segment 
   msg db 0dh,0ah,'Computer Science $'

.code              ;intializes the code segment 

abdullah proc      ;main procedure starts
    mov ax,@data
    mov ds,ax      ;initializes the data segment
    
    mov cx,10      ;setting the counter at 10
    
    mov ah,9       ;calling  function 9 to print string
    lea dx,msg     ;moving the offset of the string 'msg'
    
    print:         ;label

    int 21h        ;invoking the interrupt 
        
;it's loop which will run until the counter becomes zero 
;CX will be decreamented automatically in the loop 
   
    loop print     
    
    mov ah,4ch     ;A funtion to return the control to the OS
    int 21h        ;invoking the interrupt
    
    abdullah endp  ;Ends the main procedure
end abdullah                                          

           