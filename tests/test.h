#ifndef TEST_H
#define TEST_H

#include <stdio.h>
#include <stdlib.h>

extern unsigned tests_run;
extern unsigned assertions;
extern unsigned failures;

#define ASSERT_TRUE(expr) \
    do { \
        assertions++; \
        if(!(expr)) { \
            fprintf(stderr, "Assertion failed: %s (%s:%d)\n", #expr, __FILE__, __LINE__); \
        } \
    } while (0)

#define ASSERT_EQ(a, b) \
    do { \
        assertions++; \
        if((a) !=(b)) { \
            fprintf(stderr, "Assertion failed: %s == %s (%lu != %lu) at %s:%d\n", #a, #b, (a), (b), __FILE__, __LINE__); \
        } \
    } while (0) 

#endif