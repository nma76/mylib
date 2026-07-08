#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // message to print
    const char *str = "Hello from puts";

    // print character
    int r = my_puts(str);
    printf("\nReturn value was: %d\n", r);

    return 0;
}