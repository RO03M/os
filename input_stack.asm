[org 0x7c00]

;; this code prints in reverse, fuck it

xor cx, cx

jmp handle_input
handle_input_ret:
    mov ah, 0x0e
    mov al, 0x0d
    int 0x10
    mov al, 0x0a ; move one line down
    int 0x10
jmp print_stack

handle_input:
    mov ah, 0
    int 0x16

    cmp al, 0x0d
    je handle_input_ret

    mov ah, 0x0e
    int 0x10

    push ax

    inc cx

    jmp handle_input

print_stack:
    pop ax
    mov ah, 0x0e
    int 0x10

    loop print_stack

jmp $

; mov ah, 0x0e
; int 0x10

times 510-($-$$) db 0
db 0x55, 0xaa