#include <stdio.h>
#include <unistd.h>
#include "mylib.h"
#include "test.h"

void test_puts(void) {
    printf("Testing my_puts...\n");

    int result;

    const char *str1 = "Hello from puts\n";
    result = my_puts(str1);
    ASSERT_EQ(result, 16);

    const char *str2 = "Hellö from puts\n";
    result = my_puts(str2);
    ASSERT_EQ(result, 17);

    printf("Done!\n\n");
}