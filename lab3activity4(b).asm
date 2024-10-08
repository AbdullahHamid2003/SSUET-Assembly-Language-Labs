mov [0201h], 45h ;The value 45h is moving in 0201 
mov [0203h], 4Ch ;The value 4Ch is moving in 0203 
mov [0205h], 58h ;The value 58h is moving in 0205 
mov [0207h], 37h ;The value 37h is moving in 0207    

mov [0401h], 11h ;The value 11h is moving in 0401 
mov [0403h], 12h ;The value 12h is moving in 0403 
mov [0405h], 13h ;The value 13h is moving in 0405 
mov [0407h], 14h ;The value 14h is moving in 0407 

mov bp, 0201h    ;moving the contents of memory loc 0201 to bp
mov al, [bp]     ;stored value in bp moving to al
mov bx, 0401h    ;moving the contents of memory loc 0401 to bx
mov dl, [bx]     ;stored value in bx moving to bl
xchg al,dl       ;Exchanging the contents of dl with al & al with dl
mov [bp], al     ;al moving its contents to bp
mov [bx], dl     ;dl moving its contents to bx     

mov al,[bp+2]    ;Moving the memory address forward by 2 bytes from 0201 to 0203 
mov dl,[bx+2]    ;Moving the memory address forward by 2 bytes from 0401 to 0403
xchg al,dl       
mov [bp+2], al  
mov [bx+2], dl       

mov al,[bp+4]    ;Moving the memory address forward by 4 bytes
mov dl,[bx+4]    
xchg al,dl       
mov [bp+4], al   
mov [bx+4], dl 
   
mov al,[bp+6]    ;Moving the memory address forward by 6 bytes
mov dl,[bx+6]    
xchg al,dl       
mov [bp+6], al   
mov [bx+6], dl   
hlt                    
