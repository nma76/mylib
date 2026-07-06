.global my_putchar
// x0 is character to write

.text

my_putchar:
    // PROLOGUE
    str x30, [sp, #-16]!        // allocate 16 bytes on the stack, store x30 (link register, return address)  

    sub sp, sp, #16             // make room for the character on the stack
    strb w0, [sp]               // store character on the stack

    // prepare registers for my_write
    mov x0, #1                  // set file descriptro to 1
    mov x1, sp                  // get the character from x3
    mov x2, #1                  // one byte
    bl my_write                 // call my_write

    // EPILOGUE
    add sp, sp, #16             // restore allocated bytes on stack
    ldr x30, [sp], #16          // restore x30 from stack

    ret