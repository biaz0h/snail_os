; bootloader.asm
; Simple Bootloader
; Stage 1 Bootloader needs to be 512 bytes total

; Load this assembly at address 0x7c00
; BIOS transfer control to MBR bootloader by
; jumping to 0000:7c00h
org 0x7c00
bits 16
start : jmp boot

; Constant and vairble definitions
msg db "Welcome to Snail OS!", 0ah, 0h

boot:
	cli ;  clear intterrupt. no interrupts
	cld ;  clears direction flag. all that we need to init
	hlt ;  halt the system

; We have to be 512 bytes. Clear the rest of the bytes with 0

times 510 - ($-$$) db 0

; BIOS checks all available storage devices if any
; device is bootable, by eaxmining the last two bytes of the
; first sector whether it has the boo record signature 7C00h,
; set the program counter to that address and let the CPU executing code
; from there.
dw 0xAA55 ; Boot Signiture 
