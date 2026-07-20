#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // message to print
    const char *message = "Hej från my_write\n";

    // get length of text
    size_t length = my_strlen(message);

    // write to stdout. fd = 1 is stdout
    my_write(1, message, length);

    return 0;
}