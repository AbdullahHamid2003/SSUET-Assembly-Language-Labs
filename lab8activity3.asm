.model small              ; Allocating memory to code
.stack 100h               ; stack memory reserved 100 bytes
.data                     ; Data segment start
 temprature db 13,29,-10,-14,18,-9,12,-19,20,30
.code                     ; Code Segment 

 Abdullah proc            ;Starting of main procedure
    mov ax, @data         ;Initializing the data segment 
    mov ds, ax
    
    mov si, offset temprature  ;Moving offset of DB to SI
    mov cx,9                   ;Setting counter to 9     
    mov al,[si]                ;Store the first valuE to AL
    
    outerloop:            ;Label
    inc si                ;Increamenting SI
    cmp al,[si]           ;Comparing content of SI to AL
    jge search            ;Jump to search if greater or equal
    mov al,[si]
    
    search:               ;Label
    loop outerloop        ;Looping to outer loop
                
    mov dl,al             ;Storing the highest valuw in DL   
    mov ah,2              ;Calling function 2
    int 21h               ;Invoking interupt 21h
    
    mov ah, 4ch           ; Transfer controls to OS using fuction 4ch
    int 21h               ; Invoking interupt 21h 
       
    Abdullah endp         ; The ending of Main procedure
    end Abdullah          ; The ending of program
  