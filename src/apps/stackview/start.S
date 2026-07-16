.section .rodata
newline:
    .asciz "\n"
debug:
    .asciz "Debug"

.section .bss
.align 3
buffer:
    .space 33

.global _start

.section .text

_start:
    //
    // Initialize callee-saved registers
    //
    // We use them for two reasons: 
    //      1. Any external function could overwrite the scratch registers 
    //      2. I think it's ok not to restore them in an ELF binary, since no app iss calling this 
    //
    mov x19, #0             // x19 is used to temporary store argc
    mov x20, #0             // x20 is used to temporary store stack pointer

print_argc:
    //
    // ARGC - Argument Count
    // first 8 bytes on the stack is argc (number of arguments)
    // we use my_itoa to convert the number to ASCII and my_puts to print to stdout
    //
    ldr x19, [sp]           // load argc into scratch register x19
    mov w0, w19             // my_itoa needs the integer in x0
    ldr x1, =buffer         // buffer holding the result
    bl my_itoa              // call my_itoa

    ldr x0, =buffer         // load buffer to print into x0
    bl my_puts              // and print it

    ldr x0, =newline        // load newline into x0
    bl my_puts              // and print it
    //
    // ARGC Ends
    //

print_argv:
    //
    // ARGV - Argument Vector (list of arguments)
    // the next part of stack contains a list of arguments. Length of the list is argc.
    // the list is NULL terminated, but we use argc as counter instead of looping until we find \0
    //
    add x20, sp, #8         // store stack pointer so we can step by 8 instead of 16

loop_argv:                 // we need to loop according to argc, which is stored in x9
    cbz w19, done_argv       // if x9 reach 0, loop is done!

    ldr x0, [x20], #8       // load pointer 
    bl my_puts              // print whatever is at that pointer

    ldr x0, =newline        // load newline into x0
    bl my_puts              // and print it

    sub w19, w19, #1
    b loop_argv
done_argv:
    //
    // ARGV Ends
    //







    // 
    // EXIT - using Linux Syscal
    //
    mov x0, #42
    mov x8, #93
    svc #0
     