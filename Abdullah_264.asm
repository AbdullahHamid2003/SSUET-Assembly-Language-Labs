.model small           ;allocates the memory to code
.stack 100h            ;reserves 100 bytes
.data
menu db ,0DH,0AH,'*****************MENU*********************$' 
menu1 db ,0DH,0AH,'Press 1 for rikshw$'                                                                  
menu2 db ,0DH,0AH,'Press 2 for cars$' 
menu3 db ,0DH,0AH,'Press 3 for bus$'
menu4 db ,0DH,0AH,'Press 4 to show the record$' 
menu5 db ,0DH,0AH,'Press 5 to delete the record$' 
menu6 db ,0DH,0AH,'Press 6 to exit',0Ah,0Dh, '$' 
msg1 db 'Parking Is Full$'
msg2 db 'Wrong input$'
msg3 db 'car$'
msg4 db 'bus$'
msg5 db 'record$'
msg6 db 'there is more space$'
msg7 db 'the total amount is=$'
msg8 db ,0DH,0AH,'the total numbers of vehicles parked=$'
msg9 db ,0DH,0AH,'the total number of rikshws parked=$'
msg10 db ,0DH,0AH,'the total number of cars parked=$'
msg11 db ,0DH,0AH,'the total number of buses parked=$'
msg12 db '***Record deleted successfully***$'    

amount dw 0        ;initializing the amount with 0
count dw  '0'      ;initializing the count with 0

R dw '0'           ;initializing the R with 0
C db '0'           ;initializing the C with 0
B db '0'           ;initializing the B with 0

.code             ;code segment initializes

Abdullah proc     ;main procedure starts
    
mov ax,@data      ;data segment initialization
mov ds,ax

while_:           ;Label field
             
mov dx,offset menu       ;Set of instruction to print String 
mov ah,9                  
int 21h

mov dx,offset menu1      ;Set of instruction to print String
mov ah,9
int 21h

mov dx,offset menu2      ;Set of instruction to print String
mov ah,9
int 21h

mov dx,offset menu3      ;Set of instruction to print String
mov ah,9
int 21h

mov dx,offset menu4      ;Set of instruction to print String
mov ah,9
int 21h

mov dx,offset menu5      ;Set of instruction to print String
mov ah,9
int 21h

mov dx,offset menu6      ;Set of instruction to print String
mov ah,9
int 21h 

mov ah,1          ;Funtion 1 for single digit input
int 21h           ;invokes the interrupt
mov bl,al         ;moving the contents of al in bl

mov ah,2          ;Set of instruction for line feed 
mov dl,0ah        ;& carriage return, 
int 21h
mov dl,0dh
int 21h

mov al,bl         ;moving the contents of al in bl
cmp al,'1'        ;comparing contents of al with '1' 
je rikshw         ;if compared then jump to rikshaw
cmp al,'2'        ;comparing contents of al with '2'
je car            ;if compared then jump to car
cmp al,'3'        ;comparing contents of al with '3'
je bus            ;if compared then jump to bus
cmp al,'4'        ;comparing contents of al with '4'
je rec            ;if compared then jump to record
cmp al,'5'        ;comparing contents of al with '5'
je del            ;if compared then jump to delete
cmp al,'6'        ;comparing contents of al with '6'
je end_           ;if compared then jump to end proc.

mov dx,offset msg2     ;Set of instruction to print String
mov ah,9
int 21h

mov ah,2               ;Set of instruction for line feed 
mov dl,0ah             ;& carriage return, 
int 21h
mov dl,0dh
int 21h

jmp while_              ;unconditional jump to while_
                                                         
rikshw:
call rikshaw            ;calling Rekshaw Procedure
car:
call caar               ;calling Caar Procedure
rec:
call recrd              ;calling record Procedure
del:
call delt               ;calling delete Procedure
bus:
call buss               ;calling buss Procedure
end_:
mov ah,4ch              ;exit to DOS
int 21h                 ;invokes the interrupt

Abdullah endp           ;Main procedure ends

rikshaw proc            ;Rikshaw procedure initializes
cmp count,'8'           ;compare our counter with '8'
jle rikshw1             ;If count is less/equal then jump to rikshaw
mov dx,offset msg1      ;Set of instruction to print String
mov ah,9
int 21h
jmp while_              ;Unconditional jump to while_
jmp end_                ;Unconditional jump to end_

rikshw1:
mov ax,200              ;moving 200 into AX
add amount, ax          ;add 200 in amount
mov dx,0                ;set dx(remaider) to 0
mov bx,10               ;Set bx(divisor) to 10
mov cx,0                ;Set cx(counter) to 0
l2:
        div bx          ;dividing bx with al
        push dx         ;Push the remaider in stack
        mov dx,0        ;again remaider set to 0
        mov ah,0        ;set ah to 0
        inc cx          ;increamenting CX
        cmp ax,0        ;Comparing ax with 0
        jne l2          ;if not equal then jump to l2 
   
l3:
        pop dx          ;Poping all the elements of dx from stack
        add dx,'0'      ;adding 0 in dx
        mov ah,2        ;funtion 2 to print 
        int 21h         ;invokes the interrupt
        loop l3

        inc count       ;increamenting count
        inc r           ;increamenting r
        jmp while_      ;Unconditional jump to while_
        jmp end_        ;Unconditional jump to end_

caar proc               ;initializes the car procedure
cmp count,'8'           ;compare our counter with '8'
jle car1                ;If count is less/equal then jump to car1
mov dx,offset msg1      ;Set of instruction to print String
mov ah,9
int 21h
jmp while_              ;Unconditional jump to while_
jmp end_                ;Unconditional jump to end_

car1:
mov ax,300              ;moving 300 into AX
add amount, ax          ;add 200 in amount
mov dx,0                ;set dx(remaider) to 0
mov bx,10               ;Set bx(divisor) to 10
mov cx,0                ;Set cx(counter) to 0
l22:
        div bx          ;dividing bx with al
        push dx         ;Push the remaider in stack
        mov dx,0        ;again remaider set to 0
        mov ah,0        ;set ah to 0
        inc cx          ;increamenting CX
        cmp ax,0        ;Comparing ax with 0
        jne l22         ;if not equal then jump to l22
   
l33:
        pop dx          ;Poping all the elements of dx from stack
        add dx,'0'      ;adding 0 in dx
        mov ah,2        ;funtion 2 to print 
        int 21h         ;invokes the interrupt
        loop l33

        inc count       ;increamenting count
        inc c           ;increamenting c
        jmp while_      ;Unconditional jump to while_
        jmp end_        ;Unconditional jump to end_

buss proc               ;initializes the car procedure
cmp count,'8'           ;compare our counter with '8'
jle bus1                ;If count is less/equal then jump to bus1
mov dx,offset msg1      ;Set of instruction to print String
mov ah,9
int 21h
jmp while_              ;Unconditional jump to while_
jmp end_                ;Unconditional jump to end_

bus1:
mov ax,400              ;moving 400 into AX
add amount, ax          ;add 200 in amount
mov dx,0                ;set dx(remaider) to 0
mov bx,10               ;Set bx(divisor) to 10
mov cx,0                ;Set cx(counter) to 0
l222:
        div bx          ;dividing bx with al
        push dx         ;Push the remaider in stack
        mov dx,0        ;again remaider set to 0
        mov ah,0        ;set ah to 0
        inc cx          ;increamenting CX
        cmp ax,0        ;Comparing ax with 0
        jne l222        ;if not equal then jump to l222
   
l333:
        pop dx          ;Poping all the elements of dx from stack
        add dx,'0'      ;adding 0 in dx
        mov ah,2        ;funtion 2 to print 
        int 21h         ;invokes the interrupt
        loop l333

        inc count       ;increamenting count
        inc b           ;increamenting b
        jmp while_      ;Unconditional jump to while_
        jmp end_        ;Unconditional jump to end_

recrd proc              ;initializes the record procedure
mov dx,offset msg7      ;Set of instruction to print String
mov ah,9
int 21h

mov ax, amount          ;moving total amount in ax
mov dx,0                ;set dx(remaider) to 0
mov bx,10               ;Set bx(divisor) to 10
mov cx,0                ;Set cx(counter) to 0
totalpush:
        div bx          ;dividing bx with al
        push dx         ;Push the remaider in stack
        mov dx,0        ;again remaider set to 0
        inc cx          ;increamenting CX
        cmp ax,0        ;Comparing ax with 0
        jne totalpush   ;if not equal then jump to totalpush
   
totalprint:
        pop dx          ;Poping all the elements of dx from stack
        or dx,'0'       ;adding 0 in dx
        mov ah,2        ;funtion 2 to print 
        int 21h         ;invokes the interrupt
        loop totalprint

mov dx,offset msg8     ;Set of instruction to print String
mov ah,9
int 21h

mov dx,count           ;Set of instruction to print the 
mov ah,2               ;total count of vehicles
int 21h

mov dx,offset msg9     ;Set of instruction to print String
mov ah,9
int 21h

mov dx,R               ;Set of instruction to print count of rikshaws
mov ah,2
int 21h

mov dx,offset msg10    ;Set of instruction to print String
mov ah,9
int 21h

mov dl,C               ;Set of instruction to print count of cars
mov ah,2
int 21h

mov dx,offset msg11    ;Set of instruction to print String
mov ah,9
int 21h

mov dl,B               ;Set of instruction to print count of Buses
mov ah,2
int 21h

jmp while_             ;Unconditional jump to while_
jmp end_               ;Unconditional jump to end_                                                                                                                
         
delt proc              ;deletion procedure initializes
mov r,'0'              ;reset r to 0
mov c,'0'              ;reset c to 0
mov b,'0'              ;reset b to 0
mov amount,0           ;reset amount to 0
mov count,'0'          ;reset count to 0
mov dx,offset msg12    ;Set of instruction to print String
mov ah,9
int 21h

mov ah,2               ;Set of instruction for line feed 
mov dl,0ah             ;& carriage return, 
int 21h
mov dl,0dh
int 21h

jmp while_             ;Unconditional jump to while_
jmp end_               ;Unconditional jump to end_  

end Abdullah           ;main procedure ends