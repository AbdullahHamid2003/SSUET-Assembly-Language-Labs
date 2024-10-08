.MODEL SMALL
.STACK 100H    ;stack memory reserves 100 bytes
.DATA          ;data segment starts

PRINT DB 'Abdullah Hamid is the student of computer science and information technology department $'

.CODE          ;code segment

ABDULLAH PROC
    
    MOV AX,@DATA     ;Initializes the DS
    MOV DS,AX
    
    MOV AX,0600H     ;scroll the entire screen
    MOV BH,07H       ;normal attribute
    MOV CX,0H        ;Initializes the row and colmun on top left of the screen
    MOV DX,184FH     ;row and column of bottom right 
    INT 10H          ;invoke the interrupt
    
    MOV AH,2         ;sets the cursor option
    MOV BH,0         ;Page 0
    MOV DX,0300H     ;row 3 , column 0
    INT 10H          ;invokes the interrupt 
    
    LEA DX,PRINT     ;Displays the message given in the string(PRINT)
    MOV AH,9         ;Funtion to display string
    INT 21H          ;invokes the interrupt 
    
    MOV AH,4CH       ;A function to to return the control to OS
    INT 21H          ;invokes the interrupt 
    
    ABDULLAH ENDP    ;Ends the main procedure.
END ABDULLAH   