.global my_puts
// x0 is pointer to string
// returns: on success, a non-negative value. Often the length written

.text

my_puts:
    // PROLOGUE: often used to store x29 and x30
    str x30, [sp, #-16]!        // allocate 16 bytes on the stack and store x30 (link register, return address). We only need 24 nytes, but we allocate in blocks of 16 to follow ABI!

    // we store x0 since later calls will overwrite it with it's return values
    str x0, [sp, #8]           // store pointer in x0 on the stack, 8 bytes in, to not overwrite the stored x30

    // prepare and call my_strlen
    // x0 should hold pointer to string, and it alreay does since my_puts also uses const char *str as calling argument
    // which means we can call my_strlen right away!
    bl my_strlen                // call my_strlen to get length of string to print using my_write.

    // prepare and call my_write
    mov x2, x0                  // length is in x0 since it's the return value from my_strlen. use it before it's overwritten.
    mov x0, #1                  // set file descriptor to 1
    ldr x1, [sp, #8]            // load value stored in stack to x1. This is what we want to print.
    bl my_write                 // call my_write, which returns length of printed string into x0 which we can return!

    // EPILOGUE: often used to restore x29 and x30
    ldr x30, [sp], #16          // restore x30 from stack

    ret