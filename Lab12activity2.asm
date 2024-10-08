func macro func         
    mov ah,func
    int 21h
    endm   
   ;Macro function for LineFeed CarriageReturn                  
 NewLine macro LF,CR
    mov ah,2
    mov dl,LF
    int 21h
    mov dl,CR
    int 21h   
    endm
  function macro str         
    mov ah,9         ;set of instruction to print the string
    mov dx,offset str
    int 21h
    endm 
.model small
.stack 100h
.data
NM db 'Name: $'
FN db 'Father Name: $'
AGE db 'Age: $'
RN db 'RollNo: $'
DOB db 'Date Of Birth: $'
.code                ;Code Segment initializes
 Abdullah proc       ;Starting of main procedure
    mov ax,@data     ;Initializing the data segment 
    mov ds,ax     
function NM
input:
func 1
    cmp al,13        ;comparing al with hex equilent of 'enter'
    je next1         ;if equal then jump to next1
    mov [si],al      ;moving the contents of al at memory loc og SI
    inc si           ;increamenting SI
    jmp input        ;jump to input
    
   next1:
   NewLine 0ah,0dh   ;Calling LineFeed CarriageReturn through Macro 
function FN 
input1:  
func 1
    cmp al,13        ;comparing al with hex equilent of 'enter'
    je next2         ;if equal then jump to next2
    mov [si],al      ;moving the contents of al at memory loc og SI
    inc si           ;increamenting SI
    jmp input1       ;jump to input1
  

   next2:
   NewLine 0ah,0dh   ;Calling LineFeed CarriageReturn through Macro 
function AGE 
input2:
func 1 
    cmp al,13        ;comparing al with hex equilent of 'enter'
    je next3         ;if equal then jump to next3
    mov [si],al      ;moving the contents of al at memory loc og SI
    inc si           ;increamenting SI
    jmp input2       ;jump to input2
    
   next3:
   NewLine 0ah,0dh   ;Calling LineFeed CarriageReturn through Macro 
 function RN 
 input3:
 func 1 
    cmp al,13        ;comparing al with hex equilent of 'enter'
    je next4         ;if equal then jump to next4
    mov [si],al      ;moving the contents of al at memory loc og SI
    inc si           ;increamenting SI
    jmp input3       ;jump to input3 
    
    next4:
   NewLine 0ah,0dh   ;Calling LineFeed CarriageReturn through Macro
 function DOB
 input4:
 func 1
    cmp al,13        ;comparing al with hex equilent of 'enter'
    je exit          ;if equal then jump to exit
    mov [si],al      ;moving the contents of al at memory loc og SI
    inc si           ;increamenting SI
    jmp input4       ;jump to input4  
   
   exit:   
   mov ah, 4ch  ; Transfer controls to OS using fuction 4ch
   int 21h  ; Invoking interupt 21h                               
                                       
Abdullah endp  ; The ending of Main procedure
end Abdullah  ; The ending of