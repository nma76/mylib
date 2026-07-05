.global my_write
// x0 is file descriptor
// x1 is pointer to buffer
// x2 is number of bytes

.text

my_write:
    mov x8, #64         // write syscall is number 64
    svc #0              // execute system call
    ret                 // return