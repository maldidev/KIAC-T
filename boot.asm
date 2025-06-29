; Multiboot header for QEMU -kernel option
section .multiboot
align 4
multiboot_header:
    dd 0x1BADB002              ; Magic number
    dd 0x00000003              ; Flags
    dd -(0x1BADB002 + 0x00000003) ; Checksum

section .text
global _start
_start:
    ; Set up stack
    mov esp, stack_top

    ; Call kernel main
    extern kernel_main
    call kernel_main

    ; Halt if kernel returns
    cli
    hlt

section .bss
align 16
stack_bottom:
    resb 16384 ; 16KB stack
stack_top: