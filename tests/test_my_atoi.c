#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // string to convert
    const char *source = " 1";

    // where to store resultl
    int result;

    // do conversion
    bool success = my_atoi(source, &result);

    // print results
    printf("Return status: %d\n", success);
    printf("Return value: %d\n", result);

    return 0;
}