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
//      x9      is a constant containing the value 10. It's used to calculate modulo with sdiv
//      x10     holds the digit/char we currently working on
//      x11     is a flag that decides if we just count bytes or do the conversion
//                  0 means count bytes
//                  1 means do conversion
//      x12     is our counter that holds the length we need to reserve for the final string
//      x13     holds a copy of the original int in x0, used in loop for calculations

.text

// todo, handle negative integers. Maybe use NEG and store a flag so we can use NAG again at end?
my_itoa:
    // PROLOGUE: often used to store x29 and x30
    str x30, [sp, #-16]!        // allocate 16 bytes on the stack, store x30 (link register, return address)  

    mov x9, #10                 // store the value #10 in x9 to do modulo calculations   

    mov x11, #1                 // set flag to 0, count the bytes

    mov x12, #1                 // length is initialized at 1 to make room for 0 termination

    mov x13, x0                 // copy x0 to x13 so we can do maths without destroying the original integer

loop:
    // use mod 10 to get the last digit and store it in x10
    sdiv x10, x13 ,x9            // first, devide the input int by 10 and store it in x10
    msub x10, x10, x9, x13       // 

    add x10, x10, #48           // we need to convert digit to ASCII. We can do that by adding 48
    
    cmp x11, #1                 // if flag is set to 1, insert the number into a register holding the result.
    b.eq store_result

    add x12, x12, #1            // otherwise, increase counter

next_number:
    sdiv x13, x13, x9           // divide by 10 to get the next number to work with. Eg the number 123 becomes 12.

    cmp x13, #0                 // if x0 is not 0, continue loop
    b.ne loop

    cmp x11, #1                 // if x11 is set to 1, we are done
    b.eq success
    b start_conversion          // if not, it's time to reserve space and do the conversiobn

start_conversion:
    mov x11, #1                 // set flag to 1, meaning from now on we store result
    mov x13, x0                 // restore x13 from x0 so we can start the loop over again
    b loop

store_result:
    strb w10, [x1], #1
    b next_number

// todo: fail is not used at this time
fail:
    mov x0, #0

success:
    strb wzr, [x1], #1          // add 0 to end of string
    mov x0, #1

done:
    // EPILOGUE: often used to restore x29 and x30
    ldr x30, [sp], #16          // restore x30 from stack

    ret