#include <stdio.h>
#include "mylib.h"

int main(void)
{
    // string values to parse with my_atoi
    const char *source[] = { "23", "543", "-42", "+42", "+1+42", "", " ", "abx", "12 abc", "abc 123" };

    // get number of strings to test
    int arr_length = sizeof(source) / sizeof(source[0]);

    // holds the results
    int result;
    bool status;

    // iterate all strings and print status of parsing
    for(int i=0; i<arr_length; i++) {
        result = -999;
        status = my_atoi(source[i], &result);

        printf("Parsing the string: %s\n", source[i]);
        printf("\t my_atoi returned status: %d\n", status);
        printf("\t my_atoi parsed value: %d\n\n", result);
    }

    return 0;
}