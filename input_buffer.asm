[org 0x7c00]

mov bx, buffer

read:
    mov ah, 0
    int 0x16 ; input wait
    
    cmp al, 0x0d ; enter
    je read_end

    mov ah, 0x0e
    int 0x10
    ; reads and the stores the char into the buffer pointer (bx)
    mov [bx], al

    inc bx

    cmp bx, buffer + 9
    je read_end

    jmp read

println:
    mov ah, 0x0e
    mov al, 0x0d
    int 0x10
    mov al, 0x0a ; move one line down
    int 0x10

    jmp print

read_end:
    mov bx, buffer
    jmp println

print:
    mov ah, 0x0e
    mov al, [bx]

    cmp al, 0
    je exit

    int 0x10

    inc bx

    jmp print

exit:
    jmp $

buffer:
    times 10 db 0 ; 10 bytes to the string and the null terminator

times 510-($-$$) db 0
db 0x55, 0xaa