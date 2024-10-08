Title Lab 12 Task 1
 
 function macro func  ;macro funtion
        
        mov ah,func   ;calling func
        int 21h       ;Invokes the interrupt
        endm          ;ending of macro function  
NewLine macro LF,CR   ;Decalare lf and cr 
        mov ah,2      ;calling funtion 2
        mov dl,LF     ;moving the value of LF in dl
        int 21h       ;Invokes the interrupt
        mov dl,CR     ;moving the value of CR in dl
        int 21h       ;Invokes the interrupt                                                     
        endm          ;ending of macro function       
       
.model small          ;allocates the memory to code
.stack 100h           ;reserves 100 bytes
.code                 ;code segment initializes
Abdullah proc         ;main procedure initializes
      
 
     function 1
       mov bl,al      ;moving the contents of al in bl
     NewLine 0ah,0dh  ;sets the value of lf and cr

     mov dl,bl        ;moving the contents of bl in dl
     function 2
     mov ah, 4ch      ;Exit to DOS
     int 21h          ;Invokes the interrupt                               
                                       
    Abdullah endp     ;Main procedure ends
    end Abdullah      