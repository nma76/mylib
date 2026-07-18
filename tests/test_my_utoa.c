#include <stdio.h>
#include <stdint.h>
#include "mylib.h"

int main(void)
{
    // value to convert to string
    uint64_t source = 4294967295;

    // destination buffer
    char dest[33];

    // result of conversion
    bool result = false;

    // do conversion
    result = my_utoa(source, dest);

    // print results
    printf("Unsigned Integer to convert is %lu\n", source);
    printf("Returned value is %d\n", result);
    printf("Converted string is: %s\n", dest);

    return 0;
}