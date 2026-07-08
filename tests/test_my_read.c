#include <stdio.h>
#include <stdlib.h>
#include "mylib.h"

int main(void)
{
    // message to print
    char buf[10];

    // read from stdin
    ssize_t r = my_read(0, &buf, 10);

    // early exit on error
    if(r < 0)
        return EXIT_FAILURE;

    // print result
    for (int i=0; i<r; i++) {
        if(buf[i] == '\n') {
            printf("[%i] = 0x%02X \\n\n ", i, (unsigned char)buf[i]);
        } else {
            printf("[%i] = 0x%02X (%c)\n ", i, (unsigned char)buf[i], buf[i]);
        }        
    }
    
    // print return value
    printf("Return value is: %zd", r);

    return 0;
}