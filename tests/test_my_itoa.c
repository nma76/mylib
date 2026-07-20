#include <stdio.h>
#include <limits.h>
#include "mylib.h"
#include "test.h"

void test_itoa(void) {
    printf("Testing my_itoa...\n");

    int source;
    char dest[33];
    bool result = false;
    char expected[33];

    source = 42;
    result = my_itoa(source, dest);
    sprintf(expected, "%d", 42);
    ASSERT_TRUE(result);
    ASSERT_STR_EQ(dest, expected);

    source = -42;
    result = my_itoa(source, dest);
    sprintf(expected, "%d", -42);
    ASSERT_TRUE(result);
    ASSERT_STR_EQ(dest, expected);

    source = +42;
    result = my_itoa(source, dest);
    sprintf(expected, "%d", 42);
    ASSERT_TRUE(result);
    ASSERT_STR_EQ(dest, expected);

    source = 0;
    result = my_itoa(source, dest);
    sprintf(expected, "%d", 0);
    ASSERT_TRUE(result);
    ASSERT_STR_EQ(dest, expected);

    source = INT_MIN;
    result = my_itoa(source, dest);
    sprintf(expected, "%d", -2147483648);
    ASSERT_TRUE(result);
    ASSERT_STR_EQ(dest, expected);

    printf("Done!\n\n");
}