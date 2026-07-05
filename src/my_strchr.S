.global my_strchr
// x0 is pointer to string to search
// x1 is character to find

.text

my_strchr:
    and w1, w1, #0xFF       // mask the lowest byte

loop:
    ldrb w2, [x0], #1       // read first character from source string into w2 and increase pointer by one
    cmp w1, w2              // compare it with character to search for
    b.eq found              // if chars match, go to found
    cbz w2, not_found       // if we reach end of string, jump to not_found
    b loop                  // continue loop

found:
    sub x0, x0, #1          // subtract one from pointer to include the char we searched for
    b done                  // jump to done

not_found:
    mov w0, #0              // set return value, x0, to zero

done:
    ret