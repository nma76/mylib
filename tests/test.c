#include <stdio.h>
#include "mylib.h"
#include "test.h"

unsigned tests_run = 0;
unsigned assertions = 0;
unsigned failures = 0;

test_fn tests[] = {
    test_atoi,
    test_getchar,
    test_itoa,
    test_memcpy,
    test_memset,
    test_putchar,
    test_puts,
    test_read,
    test_strchr,
    test_strcmp,
    test_strcpy,
    test_strlen,
    test_utoa,
    test_write
};

int main(void) {
    for (size_t i = 0; i < sizeof(tests)/sizeof(tests[0]); i++) {
        tests_run++;
        tests[i]();
    }

    printf("\n\n------------------------------------------\n");
    printf("Tests run: %d\n", tests_run);
    printf("Assertions run: %d\n", assertions);
    printf("Failed: %d\n", failures);
    printf("------------------------------------------\n");

    return 0;
}