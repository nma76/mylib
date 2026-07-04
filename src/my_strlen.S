.global my_strlen
// x0 is pointer to our string
// x1 is our counter 

.text

my_strlen:
    mov x1, #0              // set x1 to zero. This is our string length counter

loop:
    ldrb w2, [x0], #1       // Read first character into w2 and increase pointer (x0) by 1
    cbz w2, done            // go to done if character in w2 is zero
    add x1, x1, #1          // increase x1 by one
    b loop                  // continue loop

done:
    mov x0, x1              // copy x1 (string length) to x0
    ret                     // return