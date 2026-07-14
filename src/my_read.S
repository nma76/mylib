.global my_read
// Search a string for a specific character
//
// Input:
//      x0 is file descriptor
//      x1 is pointer to buffer
//      x2 is number of bytes
// returns:
//     ssize_t, size of read data


.text

my_read:
    mov x8, #63         // read syscall is number 63
    svc #0              // execute system call
    ret                 // return