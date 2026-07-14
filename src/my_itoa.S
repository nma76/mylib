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

.text

my_itoa:
    ret