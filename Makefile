CC=gcc
CFLAGS=-Wall -Iinclude

SRC=$(wildcard src/*.S)
OBJ=$(SRC:.S=.o)

TEST_SRC=$(wildcard tests/*.c)
TEST_BIN:=$(TEST_SRC:.c=)

all: libmylib.a tests

libmylib.a: $(OBJ)
	ar rcs $@ $(OBJ)

tests: libmylib.a $(TEST_BIN)

%: %.c libmylib.a
	$(CC) $(CFLAGS) $< -L. -lmylib -o $@

clean:
	rm -f src/*.o libmylib.a bin/*