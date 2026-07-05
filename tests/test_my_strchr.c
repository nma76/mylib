#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // create string to search
    const char *string = "Hejsan!";
    char search = 'j';

    // copy string
    char *result = my_strchr(string, search);

    // print result
    if(result != NULL) {
        printf("Character found. Remaining string is: %s\n", result);
    } else {
        printf("Character not found!\n");
    }

    return 0;
}