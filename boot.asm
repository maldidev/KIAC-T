section .multiboot
align 4
multiboot_header:
    dd 0x1BADB002              ;magic number
    dd 0x00000003              ;flags
    dd -(0x1BADB002 + 0x00000003) ;checksum

section .text
global _start
_start:
    ;set up stack
    mov esp, stack_top

    ;call kernel_main()
    extern kernel_main
    call kernel_main

    ;halt if kernel returns
    cli
    hlt

section .bss
align 16
stack_bottom:
    resb 16384 ; 16KB stack
stack_top:
