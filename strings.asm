[org 0x7c00]

mov ah, 0x0e
mov bx, variable

jmp print_variable

print_variable:
    mov al, [bx]

    cmp al, 0
    je exit

    int 0x10

    inc bx

    jmp print_variable


variable:
    db "Hello, how the hell are you?", 0 ; zero is the null terminator

exit:
    jmp $

times 510-($-$$) db 0
db 0x55, 0xaa
