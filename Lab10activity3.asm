Title lab 10 activity 3
.MODEL SMALL
.STACK 100H

.DATA

MSG1 DB 0DH,0AH, 'ENTER THE FIRST NUMBER : $'
MSG2 DB 0DH,0AH, 'ENTER THE SECOND NUMBER : $'
RSLT1 DB DB 0DH,0AH, 'ADDITION RESULT IS : $'
RSLT2 DB DB 0DH,0AH, 'SUBTRACTION RESULT IS : $'
RSLT3 DB DB 0DH,0AH, 'MULTIPLICATION  RESULT IS : $' 
RSLT4 DB DB 0DH,0AH, 'DIVISION RESULT IS : $'
D1 DB 0DH,0AH, 'QUOTIENT : $'     
D2 DB 0DH,0AH, 'REMAINDER : $'  

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    CALL INPNMBR
    CALL OPERATIONS
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP

INPNMBR PROC
   
     LEA DX,MSG1
     MOV AH,9
     INT 21H
    
     MOV AH,1
     INT 21H 
     MOV BL,AL
     
    LEA DX,MSG2
    MOV AH,9
    INT 21H  
   
    MOV AH,1
    INT 21H
           
    RET
    INPNMBR ENDP

OPERATIONS PROC   
    
    ;ADDITION
    MOV AH,00H            ;reset AH to 00H
    ADD AL,BL             ;Adding AL & BL
    AAA                   ;Convert Hexa to BC
    OR AX,3030H           ;Adding 3030 to AX (for 2 digits) 
    MOV BX,AX             ;Moving content of AX to BX
    
    LEA DX,RSLT1          ;print string
    MOV AH,9              ;calling function 9
    INT 21H               ;invokes the interrupt
    
    MOV AH,2              ;calling function 2
    MOV DL,BH             ;moving content of BH to Dl
    INT 21H               ;invokes the interrupt
    
    MOV AH,2              ;calling function 2
    MOV DL,BL             ;moving content of DL to Bl
    INT 21H               ;invokes the interrupt
   
    ;SUBTRACTION
    MOV AX,0              ;AX set to 0
    MOV BX,0              ;BX set to 0
    MOV CX,0              ;CX set to 0
    MOV DX,0              ;DX set to 0
    
    MOV AH,00H            ;reset AH to 00H
    SUB AL,BL             ;Sub AL & BL
    AAS                   ;Convert Hexa to BC
    OR AX,3030H           ;Ax=3030H
    MOV BX,AX             ;Mov content of AX to BX
    
    LEA DX,RSLT2          ;print string
    MOV AH,9              ;Calling function 9
    INT 21H               ;invokes the interrupt
    
    MOV AH,2              ;calling function 2
    MOV DL,BH             ;moving the contents of BH to Dl
    INT 21H               ;invokes the interrupt
    
    MOV AH,2              ;calling function 2
    MOV DL,BL             ;moving content of DL to Bl
    INT 21H               ;invokes the interrupt
    
    ;DIVISION
    MOV AH,00H            ;reset AH to 0
    XCHG AL,BL            ;exchange BL and AL
    AAD                   ;convert hexa to BCD
    DIV BL                ;divide BL with AL
    OR AX,3030H           ;Adding 3030 to AX (for 2 digits) 
    MOV BX,AX             ;move AX to BX
    
    LEA DX,RSLT4          ;print string
    MOV AH,9              ;calling function 9
    INT 21H               ;invokes the interrupt
       
    LEA DX,D2             ;print string
    MOV AH,9              ;calling function 9
    INT 21H               ;invokes the interrupt
         
    MOV AH,2              ;calling function 2
    MOV DL,BH             ;moving the contents of BH to DL
    INT 21H               ;invokes the interrupt
     
    LEA DX,D1             ;print string
    MOV AH,9              ;calling function 9
    INT 21H               ;invokes the interrupt
   
    MOV AH,2              ;calling function 2
    MOV DL,BL             ;move BL to DL
    INT 21H               ;invokes the interrupt
    
    ;MULTIPLICATION
    MOV AX,0              ;AX set to 0
    MOV BX,0              ;BX set to 0
    MOV DX,0              ;DX set to 0
    AND AL,0FH            ;multiplying al with 0f
    MOV BL,AL             
    MOV AH,00H            ;RESET AH TO 0
    MUL BL
    AAM 
    OR AX,3030H           ;AX=3030
    MOV BX ,AX
    
    MOV AH,9              ;calling FUNCTION 9
    LEA DX,RSLT3          ;PRINT STRING
    INT 21H               ;invokes the INTERRUPT
    
    MOV AH,2              ;calling FUNCTION 2
    MOV DL,BH             ;MOVE CONTENT OF BH TO DL
    INT 21H               ;invokes the INTERRUPT
                 
    MOV AH,2              ;calling FUNCTION 2
    MOV DL,BL             ;MOVE CONTENT OF BL,TO DL
    INT 21H               ;invokes the INTERRUPT 
       
    RET
    OPERATIONS ENDP
END MAIN                                                                                                                                                            
