.section .rodata
newline:
    .asciz "\n"

.section .bss
.align 3
buffer:
    .space 33

.global _start

.section .text

_start:
    // Examine the stack by loading it into registers and print whats in there...
    // first 8 bytes on the stack is argc (number of arguments)
    ldrb w9, [sp]            // load argc to w9

    // call my_itoa to convert argc to string
    mov w0, w9
    ldr x1, =buffer
    bl my_itoa

    // print argc using my_puts
    ldr x0, =buffer
    bl my_puts

    // print newline
    ldr x0, =newline
    bl my_puts

    // 8 bytes in is argv[0]. Print it with my_puts
    ldr x0, [sp, #8]
    bl my_puts

    // print newline
    ldr x0, =newline
    bl my_puts

    // 16 bytes in is argv[1] IF passed!
    ldr x0, [sp, #16]
    bl my_puts

    // print newline
    ldr x0, =newline
    bl my_puts

    // 16 bytes in is argv[2] IF passed!
    ldr x0, [sp, #24]
    bl my_puts

    // print newline
    ldr x0, =newline
    bl my_puts

    // i will assume argv 2,3 etc. is stored in 8 byte chunks?

    // But, whats left after we read all argv?
    // Lets find out!
    // hmm... doesn't look like a pointer....
    //ldr x0, [sp, #32]
    //bl my_puts

    ldrb w9, [sp, #32]            // load argc to w9

    // call my_itoa to convert argc to string
    mov w0, w9
    ldr x1, =buffer
    bl my_itoa

    // print using my_puts
    ldr x0, =buffer
    bl my_puts

    // print newline
    ldr x0, =newline
    bl my_puts

    // 16 bytes in is argv[2] IF passed!
    ldr x0, [sp, #40]
    bl my_puts

    // print newline
    ldr x0, =newline
    bl my_puts

    // 16 bytes in is argv[2] IF passed!
    ldr x0, [sp, #48]
    bl my_puts

    // print newline
    ldr x0, =newline
    bl my_puts

    // 16 bytes in is argv[2] IF passed!
    ldr x0, [sp, #56]
    bl my_puts


    // exit syscall
    mov x0, #42
    mov x8, #93
    svc #0
     