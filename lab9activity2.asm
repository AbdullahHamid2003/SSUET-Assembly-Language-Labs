TITLE LAB 9 ACTIVITY 2

.model small       ;allocates the memory to code
.stack 100h       ;reserves 256 bytes 
.data
FNumber db 'Enter first Number: $'
SNumber db 0Dh,0Ah,'Enter second Number: $'
ADD_Result db 0Dh,0Ah,'ADDITION Result is = $'  
SUB_Result db 0Dh,0Ah,'SUBTRACTION Result is = $'        
MUL_Result db 0Dh,0Ah,'Multiplication Result is = $'
DIV_Result db 0Dh,0Ah,'DIVISION Result is = $'
.code                                 

Abdullah proc         ;starting the main procedure.
                    
    mov ax,@data      ;initializes the data segment 
    mov ds,ax
    
    Lea dx,FNumber    ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt
    
    mov ah,1          ;Input function
    int 21h           ;invokes the interrupt
    mov bl,al         ;moving the contents of al into bl
  
    lea dx,SNumber    ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt
    
    mov ah,1          ;Input function
    int 21h           ;invokes the interrupt
    
    mov ah,00h        ;set AH to 0
    add al,bl         ;adding al and bl
    AAA               ;ASCII ADJUST FOR ADDITION
    OR ax,3030h       ;add 3030 in ax
    mov bx,ax         ;moving the contents of ax into bx
    
    lea dx,ADD_Result ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt  
    
    mov ah,2          ;calling funtion 2
    mov dl,bh         ;moving the contents of bh into dl
    int 21h           ;invokes the interrupt
    
    mov ah,2          ;calling funtion 2
    mov dl,bl         ;moving the contents of bl into dl
    int 21h           ;invokes the interrupt          
    
    mov ah,2          ;FUNTION FOR LINE FEED AND CARRIAGE RETURN
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    
    ;SUBTRACTION
    Lea dx,FNumber    ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt
    
    mov ah,1          ;Input function
    int 21h           ;invokes the interrupt
    mov bl,al         ;moving the contents of al into bl
  
    lea dx,SNumber    ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt
    
    mov ah,1          ;Input function
    int 21h           ;invokes the interrupt
    
    mov ah,00h        ;set AH to 0
    SUB al,bl         ;adding al and bl
    AAA               ;ASCII ADJUST FOR ADDITION
    OR ax,3030h       ;add 3030 in ax
    mov bx,ax         ;moving the contents of ax into bx
    
    lea dx,SUB_Result ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt  
    
    mov ah,2          ;calling funtion 2
    mov dl,bh         ;moving the contents of bh into dl
    int 21h           ;invokes the interrupt
    
    mov ah,2          ;calling funtion 2
    mov dl,bl         ;moving the contents of bl into dl
    int 21h           ;invokes the interrupt      
    
    mov ah,2          ;FUNTION FOR LINE FEED AND CARRIAGE RETURN
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h 
    
    ;MULTIPLICATION
    Lea dx,FNumber    ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt
    
    mov ah,1          ;Input function
    int 21h           ;invokes the interrupt 
    AND al,0fh
    mov bl,al         ;moving the contents of al into bl
  
    lea dx,SNumber    ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt
    
    mov ah,1          ;Input function
    int 21h           ;invokes the interrupt
    AND al,0fh
    
    mov ah,00h        ;set AH to 0
    MUL bl            ;MULTIPLYING bl
    AAM               ;ASCII ADJUST FOR MULTIPLICATION
    OR ax,3030h       ;add 3030 in ax
    mov bx,ax         ;moving the contents of ax into bx
    
    lea dx,MUL_Result ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt  
    
    mov ah,2          ;calling funtion 2
    mov dl,bh         ;moving the contents of bh into dl
    int 21h           ;invokes the interrupt
    
    mov ah,2          ;calling funtion 2
    mov dl,bl         ;moving the contents of bl into dl
    int 21h           ;invokes the interrupt                           
                                                              
    mov ah,2          ;FUNTION FOR LINE FEED AND CARRIAGE RETURN
    mov dl,0dh
    int 21h
    mov dl,0ah
    int 21h     
    
    ;DIVISION
    Lea dx,FNumber    ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt
    
    mov ah,1          ;Input function
    int 21h           ;invokes the interrupt   
    AND al,0fh        ;
    mov bl,al         ;moving the contents of al into bl
  
    lea dx,SNumber    ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt
    
    mov ah,1          ;Input function
    int 21h           ;invokes the interrupt
    AND al,0fh
    
    mov ah,00h        ;set AH to 0
    AAD               ;ASCII ADJUST FOR DIVISION
    DIV bl            ;dividing bl with al
    OR ax,3030h       ;add 3030 in ax
    mov bx,ax         ;moving the contents of ax into bx
    
    lea dx,DIV_Result ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt  
    
    mov ah,2          ;calling funtion 2
    mov dl,bh         ;moving the contents of bh into dl
    int 21h           ;invokes the interrupt
    
    mov ah,2          ;calling funtion 2
    mov dl,bl         ;moving the contents of bl into dl
    int 21h           ;invokes the interrupt                                                      
                                                              
    mov ah,4ch        ;exit to dos
    int 21h           ;invokes the interrupt
    
    Abdullah endp     ;ending of main procedure
    end Abdullah