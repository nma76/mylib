.global my_memcpy
// x0 is pointer to destination
// x1 is pointer to source
// x2 is number of bytes to copy

.text

my_memcpy:
    cbz x2, done            // early exit if x2 is zero
    mov x4, x0              // store original pointer to dest in x4

loop:
    ldrb w3, [x1], #1       // read first byte from source into w3 and increase pointer by one
    strb w3, [x0], #1       // store byte from w3 to dest and increase pointer by one
    subs x2, x2, #1         // decrease counter by one
    b.ne loop               // continue loop if x2 is not zero

done:
    mov x0, x4              // move stored pointer to x0 (the return value)
    ret