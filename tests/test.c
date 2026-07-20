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
    test_strlen();

    tests_run++;
    test_itoa();

    tests_run++;
    test_memcpy();


    printf("\n\n------------------------------------------\n");
    printf("Tests run: %d\n", tests_run);
    printf("Assertions run: %d\n", assertions);
    printf("Failed: %d\n", failures);
    printf("------------------------------------------\n");

    return 0;
} 