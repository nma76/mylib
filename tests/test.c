#include <stdio.h>
#include "mylib.h"
#include "test.h"

unsigned tests_run = 0;
unsigned assertions = 0;
unsigned failures = 0;

int main(void) {
    tests_run++;
    test_atoi();

    tests_run++;
    test_getchar();

    tests_run++;
    test_itoa();

    tests_run++;
    test_memcpy();

    tests_run++;
    test_memset();

    tests_run++;
    test_putchar();

    tests_run++;
    test_puts();

    tests_run++;
    test_read();

    tests_run++;
    test_strlen();



    printf("\n\n------------------------------------------\n");
    printf("Tests run: %d\n", tests_run);
    printf("Assertions run: %d\n", assertions);
    printf("Failed: %d\n", failures);
    printf("------------------------------------------\n");

    return 0;
} 