.MODEL SMALL
.STACK 100H       ;stack memory reserves 100 bytes
.DATA             ;data segment starts

FIRST DB '1 2 3 4 5 $'
SECOND DB '2 3 4 $'
FOURTH DB '4 3 2 $'
FIFTH DB '5 4 3 2 1 $'

.CODE             ;code segment

ABDULLAH PROC     ;starting of main procedure 
    
    MOV AX,@DATA     ;Initializes the DS
    MOV DS,AX  
    
    MOV AX,0600H     ;scroll the entire screen
    MOV BH,07H       ;normal attribute
    MOV CX,0H        ;starts at 0000h
    MOV DX,184FH     ;ends at 184F
    INT 10H          ;invoke the interrupt
    
    MOV AH,2         ;sets the cursor option
    MOV BH,0         ;Page 0
    MOV DX,0A25H     ;row 0A position , column 25 position
    INT 10H          ;invokes the interrupt
    
    LEA DX,FIRST     ;moving the offset of string 'FIRST' to DX
    MOV AH,9         ;funtion to display string
    INT 21H          ;invokes the interrupt 
   
    MOV AH,2         ;sets the cursor option
    MOV BH,0         ;Page 0         
    MOV DX,0B27H     ;row 0B position , column 27 position
    INT 10H          ;invokes the interrupt
    
    LEA DX,SECOND    ;moving the offset of string 'second' to DX
    MOV AH,9         ;funtion to display string
    INT 21H          ;invokes the interrupt 
    
    MOV AH,2         ;sets the cursor option
    MOV BH,0         ;Page 0
    MOV DX,0C29H     ;row 0C position , column 29 position
    INT 10H          ;invokes the interrupt
    
    MOV DL, '3'      ;moving 3 in DL register
    MOV AH,2         ;A funtion to display a character
    INT 21H          ;invokes the interrupt 
    
    MOV AH,2         ;sets the cursor option
    MOV BH,0         ;Page 0
    MOV DX,0D27H     ;row 0D position , column 27 position
    INT 10H          ;invokes the interrupt
    
    LEA DX,FOURTH    ;moving the offset of string 'FOURTH' to DX
    MOV AH,9         ;funtion to display string
    INT 21H          ;invokes the interrupt 
    
    MOV AH,2         ;sets the cursor option
    MOV BH,0         ;Page 0
    MOV DX,0E25H     ;row 0E position , column 25 position
    INT 10H          ;invokes the interrupt  
    
    LEA DX,FIFTH     ;moving the offset of string 'FIFTH' to DX
    MOV AH,9         ;funtion to display string
    INT 21H          ;invokes the interrupt 
    
    MOV AH,4CH       ;giving the control back to the OS   
    INT 21H          ;invokes the interrupt 
    
    END ABDULLAH     ;ends the main procedure