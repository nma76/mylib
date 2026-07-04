CC=gcc
CFLAGS=-Wall -Iinclude

SRC := $(wildcard src/*.S)
OBJ := $(patsubst src/%.S,obj/%.o,$(SRC))

TEST_SRC := $(wildcard tests/*.c)
TEST_BIN := $(addprefix bin/,$(notdir $(TEST_SRC:.c=)))

all: libmylib.a tests

libmylib.a: $(OBJ)
	ar rcs $@ $(OBJ)

tests: libmylib.a $(TEST_BIN)

bin/%: tests/%.c libmylib.a
	$(CC) $(CFLAGS) $< -L. -lmylib -o $@

obj/%.o: src/%.S
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f libmylib.a bin/* obj/*