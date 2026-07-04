#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // create source and destination
    char s[] = "Hejsan";
    char d[6];

    // copy string
    my_strcpy(d, s);

    // print result
    printf("Source string: %s\n", s);
    printf("Destination string: %s\n", d);

    return 0;
}