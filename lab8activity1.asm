.model small                    ;Allocating memory to code
.stack 100h                     ;stack memory reserved 100 bytes
.data                           ;Data segment start
 numbers db 68h,87h,96h,45h,75h
.code                           ;Code Segment 

 Abdullah proc                  ;Starting of main procedure
    mov ax, @data               ;Initializing the data segment 
    mov ds, ax
    
    mov cx,4                    ;Setting counter to 4
    mov bx,offset numbers       ;Moving offset of "DB" into BX
    mov ax,[bx]                 ;Moving contents of BX to AX 
   
    lback:                      ;Label
    cmp al,[bx+1]               ;Compare AL with next value of BX
    jc swap                     ;Jump to Swap
    
    sback:                      ;Label
    inc bx                      ;Increamenting BX
    loop lback                  ;Loop back to lback
    jmp exit                    ;Jump to exit
    
    swap:                       ;Label
    mov al,[bx+1]               ;Moving highest value after comparing
    jmp sback                   ;Jump to sback
    
    exit:                       ;Label
    mov ah, 4ch                 ;Transfer controls to OS using fuction 4ch
    int 21h                     ;Invoking interupt 21h 
       
    Abdullah endp               ;The ending of Main procedure
    end Abdullah                ;The ending of program   
    
    