.global my_strcpy
// x0 is pointer to destination
// x1 is pointer to source

.text

my_strcpy:
    mov x4, x0              // store original pointer to dest in x4

loop:
    ldrb w2, [x1], #1       // read first character from source into w2 and increase pointer by one
    strb w2, [x0], #1       // copy character from w2 to dest and increase pointer by one
    cbz w2, done            // goto done if character is zero
    b loop                  // read next character

done:
    mov x0, x4              // move stored pointer to dest to x0
    ret                     // return