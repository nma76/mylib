#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // create buffer to fill
    char b[10];

    // set 65 (ASCII A) as value 
    my_memset(b, 65, sizeof(b));

    // print buffer, should be ten A
    for(int i=0; i<10; i++) {
        printf("Data at pos %i is %c\n", i, b[i]);
    }

    return 0;
}