Title lab 8 activity 4
.model small       ; Allocating memory to code
.stack 100h        ; stack memory reserved 100 bytes
.data              ; Data segment start
 first_name db 'abdullah'
.code              ; Code Segment 

 Abdullah proc     ;Starting of main procedure
    mov ax, @data  ;Initializing the data segment 
    mov ds, ax
    
    mov si,offset first_name  ;Moving offset of DB to SI
    mov cx,8                  ;Setting counter to 6     
    
    loop1:         ;Label
    
    mov dl,[si]    ;Moving content of SI to DL   
    sub dl,20h     ;Subracting 32 to make uppercase
    mov ah,2       ;Calling function 2
    int 21h        ;Invoking interupt 21h
    inc si         ;Increamenting SI
    loop loop1

    mov ah, 4ch    ; Transfer controls to OS using fuction 4ch
    int 21h        ; Invoking interupt 21h 
       
    Abdullah endp  ; The ending of Main procedure
    end Abdullah   ; The ending of program