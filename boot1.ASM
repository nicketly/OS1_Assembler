org 7C00h

jmp start

msg: db 'Ryzhkov Nikita Artemovich NMT-323901',0

start:

mov ah, 00h
mov al, 13h

int 10h

mov si, msg
mov dl, 0
mov dh, 10
loop1:
mov bh, 0
mov ah, 02h
int 10h
mov al, [cs:si]
cmp al, 0
je next
mov bl, 0Bh
mov bh, 0
mov ah, 0Eh
int 10h
inc dl
inc si
jmp loop1
next:
mov si, positions
loop2:

mov ah, 0ch
mov bh, 0
mov cx, [cs:si]
cmp cx, 0
je next2
add cx, 200
add si, 2
mov dx, [cs:si]
add dx, 80
mov al, 08h

int 10h

add si, 2

jmp loop2

next2:

MOV CX, 0FH
MOV DX, 4240H
MOV AH, 86H
INT 15H
jmp exit

positions:
dw 90, 100
dw 91, 100
dw 92, 100
dw 93, 100
dw 94, 100
dw 95, 100
dw 96, 101
dw 97, 102
dw 98, 103
dw 99, 104
dw 99, 105
dw 99, 106
dw 99, 107
dw 98, 108
dw 97, 109
dw 96, 110
dw 95, 111
dw 94, 111
dw 93, 111
dw 92, 111
dw 91, 111
dw 90, 111
dw 89, 110
dw 88, 109
dw 87, 108
dw 86, 107
dw 86, 106
dw 86, 105
dw 86, 104
dw 87, 103
dw 88, 102
dw 89, 101
dw 0

exit:

db 510-($-$$) dup 0
dw 0AA55h
