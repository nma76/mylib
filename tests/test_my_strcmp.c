#include <stdio.h>
#include "mylib.h"
#include "test.h"

void test_strcmp(void) {
    printf("Testing my_strcmp...\n");

    int result;

    char *str11 = "Hejsan";
    char *str12 = "Hejsan";
    result = my_strcmp(str11, str12);
    ASSERT_EQ(result, 0);

    char *str21 = "Hejsan";
    char *str22 = "hejsan";
    result = my_strcmp(str21, str22);
    ASSERT_LT(str21, str22);

    char *str31 = "hejsan";
    char *str32 = "Hejsan";
    result = my_strcmp(str31, str32);
    ASSERT_GT(str31, str32);

    printf("Done!\n\n");
}
