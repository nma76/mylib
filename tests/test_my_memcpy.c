#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // source and destination
    int s[] = {1, 2, 3, 4, 5};
    int d[5];

    // copy memory
    my_memcpy(d, s, 5 * sizeof(int));

    // print result
    for (int i=0; i<5; i++) {
        printf("%d ", d[i]);
    }

    return 0;
}