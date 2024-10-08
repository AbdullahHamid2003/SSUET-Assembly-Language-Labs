addition macro basic,overtime,bonus
    mov ax,basic    ;moving the contensts of basic in ax
    mov bx,overtime ;moving the contensts of overtime in bx
    mov cx,bonus    ;moving the contensts of bonus in cx
    add ax,bx       ;adding the contetns of ax and bx
    add ax,cx       ;adding the contents of ax and cx
endm                ;macro procedure ends
.model small
.stack 100h
.data
res1 dw 00h
res2 dw 00h
res3 dw 00h
.code              ;Code Segment initializes 
Abdullah proc      ;Starting of main procedure
    mov ax,@data   ;Initializing the data segment 
    mov ds,ax 
    
    addition 60000,2500,3000
    mov res1,ax
    
    addition 45000,1000,500
    mov res2,ax
    
    addition 10000,500,100
    mov res3,ax
    
   mov ah, 4ch  ;Exit to DOS
   int 21h      ;Invokes the interupt                                
                                       
Abdullah endp   ;The ending of Main procedure
end Abdullah