.global my_read
// x0 is file descriptor
// x1 is pointer to buffer
// x2 is number of bytes

.text

my_read:
    mov x8, #63         // read syscall is number 63
    svc #0              // execute system call
    ret                 // return