.MODEL SMALL
.STACK 100H    ;stack memory reserves 100 bytes
.DATA          ;data segmet starts

MSG DB 'Enter your First Name: $'                                                     
FName DB 100 DUP('$')
MSG2 DB 'Your First Name is: $' 

.CODE         ;code segment

ABDULLAH PROC
    
    MOV AX,@DATA     ;Initializes the DS
    MOV DS,AX
    
       MOV AH,9         ;Function to display string
    LEA DX,MSG       ;displays the message given in the string
    INT 21H          ;invokes the interrupt
    
    LEA SI,FName     ;moving the offset of FName in SI register.  
                                                       
Input:
    MOV AH,1         ;Keyboard input with echo handler in interupt
    INT 21H          ;invokes the interrupt
    
    CMP AL,13        ;comparing the "enter"
    Je PRINT         ;if AL will be equal to 13 or Enter it will jump to label "Print"   

    MOV [SI],AL      ;Moving contents of AL into SI
    INC SI           ;increament SI
    
    JMP INPUT        ;Jumping back to Input
    
PRINT:
    MOV AH,2         ;function to display character
    MOV DL,0AH       ;moves the cursor to the next line
    INT 21H          ;invokes the interrupt
    MOV DL,0DH       ;moves the cursor to the left of the line(carriage returns)
    INT 21H          ;invokes the interrupt
    
    MOV AH,9         ;Function to display string
    LEA DX,MSG2      ;displays the message given in the string
    INT 21H          ;invokes the interrupt
    
    MOV AH,9         ;Function to display string      
    LEA DX,FName     ;moving the offset of FName to DX register
    INT 21H          ;invokes the interrupt
    
   MOV AH,4CH        ;A funtion to return the control to OS
    INT 21H          ;invokes the interrupt
    
ABDULLAH ENDP        ;Ending the main procedure
END ABDULLAH