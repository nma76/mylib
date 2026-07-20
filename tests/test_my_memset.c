#include <stdio.h>
#include "mylib.h"
#include "test.h"

void test_memset(void) {
    printf("Running my_memset...\n");

    char b[10];
    my_memset(b, 65, sizeof(b));

    ASSERT_ARR_EQ(b, "AAAAAAAAAA", 10);

    printf("Done!\n\n");
}