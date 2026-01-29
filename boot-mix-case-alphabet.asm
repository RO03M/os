mov ah, 0x0e
mov al, 'a'

int 0x10

loop:
    sub al, 31
    int 0x10

    cmp al, 'Z'
    je exit

    add al, 33
    int 0x10

    jmp loop

exit:
    jmp $

times 510-($-$$) db 0
db 0x55, 0xaa

;prints aBcDeF...xZ