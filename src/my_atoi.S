.global my_atoi
// x0 is pointer to source string
// x1 is pointer to int value, the result
// returns:
//     bool signaling if function is successfull or not

// temporary registers:
//      w9 holds the current character
//      w10 current digit if any is found
//      w11 holds the result until we are finnished. Then it goes into our pointer at x1
//      w12 holds our multiplier: the number 10. MADD (Multiply-Add) needs registry, not values
//      w13 holds our state. zero until the parsing starts, eg. we found the först digit

.text

my_atoi:
    // PROLOGUE: often used to store x29 and x30
    str x30, [sp, #-16]!        // allocate 16 bytes on the stack, store x30 (link register, return address)  

    // Store our multiplier in w12. Used by MADD later
    mov w12, #10

    // Set the state to zero
    mov w13, #0

    // use w11 to store the int value. We start by setting it to 0
    mov w11, #0

loop:
    ldrb w9, [x0], #1           // load first byte into w9
    cbz w9, check_parse_status  // if byte is null, we are done! todo: if this occurs before we hit the first digit, it's a fail

    // check for whitespaces:
    b process_character

    // todo: check if char is + (ASCII 43)
    // todo: check if char is - (ASCII 45)

    b loop                      // Continue loop

process_character:
    // todo: We should only skip initial whitespace, not all. This must be solved!!
    // check if char is a whitespace, \t, \n, \v, \f, \r (ASCII 39, 10, 11, 12, 13)
    // first, check ASCII 9 to 13 (\t, \n, \v, \f, \r)
    sub w10, w9, #9             // subtract 9 from the char. 
    cmp w10, #4                 // compare w10 to #4. if w10 is lower than, or equal to, #4 we have a whitespace character. 
    b.ls check_parse_status     // Jump to loop

    // check if character is space, ASCII 32
    cmp w9, #32                 // compare w10 with #32 (ASCII for space)
    b.eq check_parse_status     // if w10 equals 32, jump    

parse_digits:
    // Check if char is a digit (0-9 is ASCII 48-57)
    sub w10, w9, #48            // subtract 48 from the char
    cmp w10, #9                 // compare w10 to #9. if w10 is lower than, or equal to, #9 we have a digit.
    b.hs fail                   // not a digit, function fails. todo: depending on the state, if no digits were found before this jump to fail, elese success

    // We know w10 holds the digit at this point. So we can add it to the result
    mov w13, #1                 // set state to 1. Parsing has started

    // for each digit, we need to do: result (w11) = result (w11) * 10 (w12) + current digit (w10)
    madd w11, w11, w12, w10

    b loop                      // continue loop

check_parse_status:
    cbnz w13, fail              // parsing has started, w13 is not zero. We fail!
    b loop

fail:
    mov x0, #0                  // we want to return false (0) if parser fails
    b done                      // jump to done

success:
    mov x0, #1                  // return true (non-zero) on success
    
done:
    // store our parsed value in w11 in our pointer (x1)
    str w11, [x1]

    // EPILOGUE: often used to restore x29 and x30
    ldr x30, [sp], #16          // restore x30 from stack

    ret