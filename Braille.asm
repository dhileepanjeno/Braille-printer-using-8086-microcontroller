org 100h
.data
chr db 100000b,110000b,100100b,100110b,100010b,110100b,110110b,110010b,010100b,010110b,101000b,111000b,101100b,101110b,101010b,111100b,111110b,111010b,011100b,011110b,101001b,111001b,010111b,101101b,101111b,101011b,001111b
txt db "abcde"
txt_len dw 5
space dw 5
.code 
mov ax,@data
mov ds,ax
mov cx,5  
lea si,txt
mov al,0
lp:
  lea di,chr
  sub di,'a'
  mov al,[si]
  mov ah,0
  add di,ax
  mov bl,[di]
  shl bl,2
  push cx
  mov cx,len
  print: mov ah, 2
         mov dl, '.'
         test bl, 10000000b
         jz zero
         mov dx,00F8h
  zero:  int 21h
         shl bl, 1
    
  nxt:
  loop print
  pop cx
inc si
loop lp             
ret 