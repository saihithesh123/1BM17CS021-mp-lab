.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.data
msg1 db 0dh,0ah,"Enter the string 1 $"
msg2 db 0dh,0ah,"Enter the string 2 $"
msg3 db 0dh,0ah,"The two strings are equal $"
msg4 db 0dh,0ah,"The two strings are not equal $"

str1 db 10h dup(0)
str2 db 10h dup(0)
len1 dw 0
len2 dw 0
.code
mov ax,@data
mov ds,ax
display msg1
mov si,00h
Back1:mov ah,01h
      int 21h
      cmp al,0dh
      jz next1
      mov str1[si],al
      inc si
      inc len1
      jmp back1

next1:display msg2
      mov si,00h
Back2:mov ah,01h
      int 21h
      cmp al,0dh
      jz next2
      mov str2[si],al
      inc si
      inc len2
      jmp back2
next2:mov ax,len1
      mov bx,len2
      cmp al,bl
      jnz noteq
      mov si,00h
      cld
Back3:mov bl,str1[si]
      cmp bl,str2[si]
      jnz noteq
      loop back3
      display msg3
      jmp last

noteq:display msg4

last:mov ah,4ch
     int 21h
end
