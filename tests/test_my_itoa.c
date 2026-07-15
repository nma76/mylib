#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // value to convert to string
    int source = 2345;

    // destination buffer
    char dest[33];

    // result of conversion
    bool result = false;

    // do conversion
    result = my_itoa(source, dest);

    // print results
    printf("Integer to convert is %i\n", source);
    printf("Returned value is %d\n", result);
    printf("Converted string is: %s\n", dest);

    return 0;
}