.section .rodata
hello_msg:
    .asciz "Hello world!\n"
number_msg:
    .asciz "The number is: "
newline:
    .asciz "\n"

.section .bss
.align 3
buffer:
    .space 33

.global _start

.section .text

_start:
    // print hello world message
    ldr x0, =hello_msg          // load pointer to message
    bl my_puts                  // print using my_puts

    // call my_itoa to convert the number 42 to string
    mov x0, #42
    ldr x1, =buffer
    bl my_itoa

    // print the number returned by my_itoa
    ldr x0, =number_msg
    bl my_puts

    ldr x0, =buffer
    bl my_puts

    ldr x0, =newline
    bl my_puts

    mov x8, #93                 // exit syscall
    svc #0                      // invoke syscall
     