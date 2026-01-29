[org 0x7c00]

mov ah, 0
int 0x16        ; AL = key
mov [char], al

mov al, [char]
mov ah, 0x0E
int 0x10        ; print AL

jmp $

char:
    db 0

times 510-($-$$) db 0
db 0x55, 0xaa