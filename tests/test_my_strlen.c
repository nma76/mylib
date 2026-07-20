#include <stdio.h>
#include "mylib.h"
#include "test.h"

void test_strlen(void) {
    printf("Running my_strlen...\n");

    char *str = "Hejsan!";
    size_t len = my_strlen(str);
    size_t expected = 7;
    ASSERT_EQ(len, expected);

    str = " Hello\n";
    len = my_strlen(str);
    expected = 7;
    ASSERT_EQ(len, expected);

    str = "Hellö";
    len = my_strlen(str);
    expected = 6;
    ASSERT_EQ(len, expected);

    printf("Done!\n\n");
}
