.global my_strcmp
// x0 is pointer to string one
// x1 is pointer to string two

.text

my_strcmp:

loop:
    ldrb w2, [x0], #1       // read first character from x0 into w2 and increate pointer by one
    ldrb w3, [x1], #1       // read first character from x1 into w3 and increase pointer by one
    cmp w2, w3              // compare characters 
    b.ne done               // characters are not equal, exit
    cbz w2, done            // if equal and zero, exit
    b loop                  // else back to loop and read next character

done:
    sub w0, w2, w3          // set the difference as return value
    ret