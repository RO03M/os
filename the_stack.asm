[org 0x7c00]

; mov ax, 0b1111_1111_1111_1111
mov ax, 65535
call print_number

print_number:
    xor cx, cx
    mov bx, 10

    divide_and_push:
        xor dx, dx
        div bx ; divide ax by bx (10)
        ; push dx ; dx is where the remainder is stored ; the dividend is in ax
        add dl, '0'
        push dx
        inc cx

        cmp ax, 0
        je divide_and_push_end

        jmp divide_and_push
    divide_and_push_end:

    mov ah, 0x0e
    print:
        pop dx
        mov al, dl
        int 0x10

        loop print ; loop decrements from the c(x) register

    ret

.exit:
    jmp $

times 510 - ($-$$) db 0
db 0x55, 0xaa