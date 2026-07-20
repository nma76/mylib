#include <stdio.h>
#include <unistd.h>
#include "mylib.h"
#include "test.h"

void test_write(void) {
    printf("Testing my_write...\n");

    // message to print
    const char *message = "Hej från my_write\n";

    // get length of text
    size_t length = my_strlen(message);

    // write to stdout. fd = 1 is stdout
    my_write(1, message, length);

    ASSERT_EQ(length, 19);

    printf("Done!\n\n");
}