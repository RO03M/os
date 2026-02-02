[org 0x7c00]

mov ax, 0b1111_1111_1111_1111
call print_number
jmp .exit

print_number:
    mov bx, 10

    xor dx, dx
    div bx ; divide ax by bx (10)
    ; push dx ; dx is where the remainder is stored ; the dividend is in ax
    add dl, '0'
    push dx

    xor dx, dx
    div bx ; divide ax by bx (10)
    ; push dx ; dx is where the remainder is stored ; the dividend is in ax
    add dl, '0'
    push dx

    mov ah, 0x0e

    pop dx
    mov al, dl
    int 0x10
    
    pop dx
    mov al, dl
    int 0x10

    ret



.exit:
    jmp $

times 510 - ($-$$) db 0
db 0x55, 0xaa