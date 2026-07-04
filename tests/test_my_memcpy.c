#include <stdio.h>
#include "mylib.h"

int main(void)
{
    int s[] = {1, 2, 3, 4, 5};
    int d[5];

    my_memcpy(d, s, 5 * sizeof(int));

    for (int i=0; i<5; i++) {
        printf("%d ", d[i]);
    }

    return 0;
}