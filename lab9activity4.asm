TITLE LAB 9 ACTIVITY 4

.model small       ;allocates the memory to code
.stack 100h       ;reserves 256 bytes 
.data
FName db 'Enter your first name in lowercase: $'
InputName db 11,?,11 dup (?)
Uppercase db 8 dup ('$')
Display db 'Your first name is: $' 
.code                                 

Abdullah proc         ;starting the main procedure.
                    
    mov ax,@data      ;initializes the data segment 
    mov ds,ax
    
    mov dx,offset FName    ;print string
    mov ah,9               ;calling funtion 9
    int 21h                ;invokes the interrupt
    
    mov ah,0ah               ;calling function 0Ah
    mov dx,offset InputName  ;prints the string
    int 21h                  ;invokes the interrupt
    
    mov si,offset InputName  ;prints the string
    mov bx,offset Uppercase  ;prints the string
    
    mov cx,7               ;iteration 7 times
    Again:
    mov al,[si] +2         ;mov si+2 content in al
    cmp al,61h             ;compare with lowercase (a)
    jb over                ;jump if below
    cmp al,7ah             ;compare with last letter of lowercase
    ja over                ;jump if above      
    
    sub al,32
    over:
    mov [bx],al            ;moving the contents of al to address bx
    inc si                 ;increamenting si
    inc bx                 ;increamenting bx
    loop Again             ;end of loop
    
    mov ah,2          ;callig funtion 2
    mov dl,0Dh        ;carriage return
    int 21h           ;invokes the interrupt
    mov dl,0Ah        ;line feed
    int 21h           ;invokes the interrupt
  
    lea dx,Display    ;print string
    mov ah,9          ;calling funtion 9
    int 21h           ;invokes the interrupt
    
    mov ah,9          ;calling funtion 9
    lea dx,Uppercase  ;print string
    int 21h           ;invokes the interrupt
                                    
    mov ah,4ch        ;exit to dos
    int 21h           ;invokes the interrupt
    
    Abdullah endp     ;ending of main procedure
    end Abdullah
    