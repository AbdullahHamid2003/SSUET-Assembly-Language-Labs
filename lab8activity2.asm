Title lab 8 Activity 2
.model small              ; Allocating memory to code
.stack 100h               ; stack memory reserved 100 bytes
.data                     ; Data segment start
 number db 58h,37h,96h,45h,25h
.code                     ; Code Segment 

 Abdullah proc            ;Starting of main procedure
    mov ax, @data         ;Initializing the data segment 
    mov ds, ax
    mov si, offset number ;Moving offset of DB to SI
    mov cx,4              ;Setting counter to 4
    
    outerloop:            ;Label
    push cx               ;Storing CX into stack
    mov al,[si]           ;Moving SI content to AL
    mov di,si             ;Moving DI to SI
    
    innerloop:            ;Label
    inc di                ;Icreamenting DI
    cmp al,[di]           ;Comparing DI content with AL
    jbe dontswap          ;If below or equal dont swap
    
    swap:                 ;Label  
    mov dl,[di]           ;Moving DI content to DL
    mov [di],al           ;Moving DI content to AL
    mov al,dl             ;Moving AL to DL
    
    dontswap:             ;Label
    loop innerloop        ;Looping to innerloop
    mov [si],al           ;Moving SI content to AL
    pop cx                ;Retriving CX from stack
    inc si                ;Increamenting SI
    loop outerloop        ;Looping to Outerloop
    
    mov cx,5              ;Setting counter to 5  
    mov bx,offset number  ;Moving offset of DB to BX
    
    display:         ;Label
    mov dl,[bx]      ;Moving contents of BX to DL
    mov ah,2h        ;Callinf function 2
    int 21h          ;nvoking interupt 21h
    inc bx           ;Increamenting BX
    loop display     ;Looping to Display
    
    mov ah, 4ch      ; Transfer controls to OS using fuction 4ch
    int 21h          ; Invoking interupt 21h 
       
    Abdullah endp    ; The ending of Main procedure
    end Abdullah     ; The ending of program