#ifndef MYLIB_H
#define MYLIB_H

size_t my_strlen(const char *source);
char *my_strcpy(char *dest, const char *source);
int my_strcmp(char *source1, char *source2); 
void *my_memcpy(void *restrict dest, const void *restrict src, size_t n);
void *my_memset(void *dest, int c, size_t n);

#endif