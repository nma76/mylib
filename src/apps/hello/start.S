.section .rodata
msg:
    .asciz "Hello world!\n"

.global _start

.section .text

_start:
    ldr x0, =msg
    bl my_puts

    mov x0, #42
    mov x8, #93
    svc #0
     