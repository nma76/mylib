#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // create pointers to string to compare
    char *s1 = "Hejsan";
    char *s2 = "Hejsan  ";

    // compare strings
    int r = my_strcmp(s1, s2);

    // print result
    printf("Result of compare is %i\n", r);

    return 0;
}