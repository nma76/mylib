#include <stdio.h>
#include "mylib.h"
#include "test.h"

void test_strlen(void);
void test_atoi(void);
// void test_fail(void);
// void test_pass(void);

unsigned tests_run = 0;
unsigned assertions = 0;
unsigned failures = 0;

int main(void) {
    test_atoi();
    test_strlen();

    printf("\n\n------------------------------------------\n");
    printf("Tests run: %d\n", tests_run);
    printf("Assertions run: %d\n", assertions);
    printf("Failed: %d\n", failures);
    printf("------------------------------------------\n");

    return 0;
}

void test_atoi(void) {
    tests_run++;

    printf("Running my_strlen...\n");

    // holds the results
    int result;
    bool status;

    status = my_atoi("   123", &result);
    ASSERT_EQ(status, true);
    ASSERT_EQ(result, 123);

    status = my_atoi("23", &result);
    ASSERT_EQ(status, true);
    ASSERT_EQ(result, 23);

    status = my_atoi("123-456", &result);
    ASSERT_EQ(status, true);
    ASSERT_EQ(result, 123);

    status = my_atoi("-45", &result);
    ASSERT_EQ(status, true);
    ASSERT_EQ(result, -45);

    status = my_atoi("abc123", &result);
    ASSERT_EQ(status, false);
    ASSERT_EQ(result, 0);

    status = my_atoi("+42", &result);
    ASSERT_EQ(status, true);
    ASSERT_EQ(result, 42);

    status = my_atoi("12 abc", &result);
    ASSERT_EQ(status, true);
    ASSERT_EQ(result, 12);

    printf("Done!\n\n");
}

void test_strlen(void) {
    tests_run++;

    printf("Running my_strlen...\n");

    char *str = "Hejsan!";
    size_t len = my_strlen(str);
    size_t expected = 7;

    ASSERT_EQ(len, expected);

    printf("Done!\n\n");
}

void test_fail(void) {

}
void test_pass(void) {

}