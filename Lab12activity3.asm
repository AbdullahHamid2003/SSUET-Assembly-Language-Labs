multiply macro v1,v2,res
   local back
    mov bx, v1  ;moving the contents of v1 in bx
    mov cx, v2  ;moving the contents of v2 in cx
    mov ax,0    ;ax reset to 0
    
    back:       ;label field
    add ax,bx   ;adding the contents of ax and bx
    
    loop back   ;loop untill cx becomes 0
    mov res,ax  ;moving the contents of ax in res
endm            ;macro procedure ends

.model small
.stack 100h
.data
res1 dw ?
res2 dw ?
res3 dw ?
.code             ;Code Segment initializes
Abdullah proc     ;Starting of main procedure
    mov ax,@data  ;Initializing the data segment 
    mov ds,ax 
    
    multiply 2000,500,res1   
    multiply 2500,500,res2  
    multiply 300,400,res3   
    
    mov dx,res1     ;moving result1 in dx
    mov cx,res2     ;moving result2 in dx
    mov bx,res3     ;moving result3 in dx
    
       mov ah, 4ch  ;Exit to DOS
   int 21h          ;Invokes the interrupt                               
                                       
Abdullah endp  ;Main procedure ends
end Abdullah  