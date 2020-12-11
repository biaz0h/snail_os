[org 0x7c00]
[bits 16]
_start : jmp boot
msg db "Welcome to Snail OS!", 0ah, 0h
boot:
    cli
    mov si, msg
    call print

    mov si, msg
    call print
    ; mov al, 'b'
    ; call put_char
    ; jmp boot

;param:
;   DL = X coordinate
;   DH = Y coordinate
set_cursor:
    mov ah, 0x2
    mov bh, 0
    int 10h
    ret

;param:
;   AL = char
put_char:
    mov ah, 0xe
    int 10h
    ret

;param:
;   si = str ptr
print:
    lodsb
    cmp al, 0x0
    jne put_char_loop
    ret

put_char_loop:
    call put_char
    jmp print


; We have to be 512 bytes. Clear the rest of the bytes with 0
times 510 - ($-$$) db 0

; BIOS checks all available storage devices if any
; device is bootable, by eaxmining the last two bytes of the
; first sector whether it has the boo record signature 7C00h,
; set the program counter to that address and let the CPU executing code
; from there.
dw 0xAA55 ; Boot Signiture 

