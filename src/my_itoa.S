.global my_itoa
// Parse string and returns integer at the beginning. 
// It accepts initial whitespaces, plus and minus signs. As soon as we found a digit, whitespaces, plus and minus are treated as any other character
//
// Accepted:
//
// Rejected:
//
// Input:
//      x0 is source int
//      x1 is pointer to result
// returns:
//     bool signaling if function is successfull or not
//
// temporary registers:
//      x9     is a constant containing the value 10. It's used to calculate modulo with sdiv
//      x10    holds the digit/char we currently working on

.text

// todo, handle negative integers. Maybe use NEG and store a flag so we can use NAG again at end?
my_itoa:
    // PROLOGUE: often used to store x29 and x30
    str x30, [sp, #-16]!        // allocate 16 bytes on the stack, store x30 (link register, return address)  

    mov x9, #10                 // store the value #10 in x9 to do modulo calculations   

loop:
    // read the passed int into a register

    // use mod 10 to get the last digit and store it in x10
    sdiv x10, x0 ,x9
    msub x10, x10, x9, x0

    // we need to convert it to ASCII. We can do that by adding 48
    add x10, x10, #48 

    // insert the number into a register holding the result. Todo: We must insert the number at pos 0, else the result will be reversed
    strb w10, [x1], #1

    // divide by 10 to get the next number to work with 
    sdiv x0, x0, x9

    // loop until x0 is 0
    cmp x0, #0
    b.ne loop
    b success

// todo: fail is not used at this time
fail:
    mov x0, #0

success:
    // todo, reverse string before adding \n
    strb wzr, [x1], #1
    mov x0, #1

done:
    // EPILOGUE: often used to restore x29 and x30
    ldr x30, [sp], #16          // restore x30 from stack

    ret