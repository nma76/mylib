#include <stdio.h>
#include "mylib.h"
#include "test.h"

void test_strcpy(void) {
    printf("Running my_strcpy...\n");

    char source[] = "Hejsan";
    char dest[6];
    char *r = my_strcpy(dest, source);
    ASSERT_ARR_EQ(source, dest, 6);
    ASSERT_STR_EQ(source, dest);

    printf("Done!\n\n");
}
