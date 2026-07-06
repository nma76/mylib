#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // message to print
    char c = 'A';

    // print character
    int r = my_putchar(c);
    printf("\nReturn value was: %d\n", r);

    return 0;
}