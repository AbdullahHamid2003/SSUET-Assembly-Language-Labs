mov [0201h], 45h ;The value 45h is moving in 0201 
mov [0203h], 4Ch ;The value 4Ch is moving in 0203 
mov [0205h], 58h ;The value 58h is moving in 0205 
mov [0207h], 37h ;The value 37h is moving in 0207    

mov [0401h], 11h ;The value 11h is moving in 0401 
mov [0403h], 12h ;The value 12h is moving in 0403 
mov [0405h], 13h ;The value 13h is moving in 0405 
mov [0407h], 14h ;The value 14h is moving in 0407 

mov si, 0201h    ;moving the contents of memory loc 0201 to si
mov al, [si]     ;stored value in si moving to al
mov di, 0401h    ;moving the contents of memory loc 0401 to di
mov bl, [di]     ;stored value in di moving to bl
xchg al,bl       ;Exchanging the contents of bl with al & al with bl
mov [si], al     ;al moving its contents to si
mov [di], bl     ;bl moving its contents to di     

mov al,[si+2]    ;Moving the memory address forward by 2 bytes from 0201 to 0203 
mov bl,[di+2]    ;Moving the memory address forward by 2 bytes from 0401 to 0403
xchg al,bl       
mov [si+2], al  
mov [di+2], bl       

mov al,[si+4]    ;Moving the memory address forward by 4 bytes
mov bl,[di+4]    
xchg al,bl       
mov [si+4], al   
mov [di+4], bl 
   
mov al,[si+6]    ;Moving the memory address forward by 6 bytes
mov bl,[di+6]    
xchg al,bl       
mov [si+6], al   
mov [di+6], bl   
hlt            
