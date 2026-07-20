#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // create source and destination
    char *s = "Hejsan!";

    // copy string
    size_t l = my_strlen(s);

    // print result
    printf("Length of string is: %li\n", l);

    return 0;
}