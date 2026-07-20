#include <stdio.h>
#include "mylib.h"
#include "test.h"

void test_putchar(void) {
    printf("Running my_putchar...\n");

    char chr;
    int result;

    chr = ' ';
    result = my_putchar(chr);
    ASSERT_EQ(result, 32);

    chr = 'A';
    result = my_putchar(chr);
    ASSERT_EQ(result, 65);


    printf("Done!\n\n");
}