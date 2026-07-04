.global my_memset
// x0 is pointer to destination
// x1 is value to set
// x2 is number of bytes to set to value

.text

my_memset:
    cbz x2, done            // early exit if x2 is zero
    mov x4, x0              // store original pointer to dest in x4

loop:
    strb w1, [x0], #1       // write one byte from w1 to dest and increase pointer by one
    subs x2, x2, #1
    b.ne loop

done:
    mov x0, x4              // move stored pointer to x0 (the return value)
    ret