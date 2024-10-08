;The given block is moving in 0200-0207h memory locations.
mov [0200h],1fh
mov [0201h],45h
mov [0202h],89h
mov [0203h],4Ch
mov [0204h],2Ah
mov [0205h],58h
mov [0206h],64h
mov [0207h],37h

mov bx,0200h      ; moving 0200 into bx as the BX register can also holds the offset.
mov al,[bx]       ; moving the contents of BX into al register.
mov [0400h],al    ; now here we are moving the contents of AL to 0400 memory location.      
mov bx,0201h
mov al,[bx]
mov [0401h],al
mov bx,0202h      
mov al,[bx]
mov [0402h],al
mov bx,0203h      
mov al,[bx]
mov [0403h],al
mov bx,0204h      
mov al,[bx]
mov [0404h],al
mov bx,0205h   
mov al,[bx]
mov [0405h],al
mov bx,0206h       
mov al,[bx]
mov [0406h],al
mov bx,0207h       
mov al,[bx]
mov [0407h],al 
hlt              ;hlt(hault) terminates the program.