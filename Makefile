CC=gcc
CFLAGS=-Wall -Iinclude

# Assemblybibliotek
SRC := $(wildcard src/lib/*.S)
OBJ := $(patsubst src/lib/%.S,obj/%.o,$(SRC))

# Tester
TEST_SRC := $(wildcard tests/*.c)
TEST_BIN := $(addprefix bin/,$(notdir $(TEST_SRC:.c=)))

# Appar under src/apps/<app>/start.S
APP_START := $(wildcard src/apps/*/start.S)
APPS := $(notdir $(patsubst src/apps/%/start.S,%,$(APP_START)))
APP_BIN := $(addprefix bin/,$(APPS))

all: libmylib.a tests apps

libmylib.a: $(OBJ)
	ar rcs $@ $(OBJ)

tests: libmylib.a $(TEST_BIN)

apps: $(APP_BIN)

# Bygg testbinärer
bin/%: tests/%.c libmylib.a
	$(CC) $(CFLAGS) $< -L. -lmylib -o $@

# Bygg app-binärer från start.S
bin/%: src/apps/%/start.S libmylib.a
	as $< -o obj/$*.o
	ld obj/$*.o libmylib.a -o $@

# Generell regel för .o från src/*.S
obj/%.o: src/lib/%.S
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f libmylib.a bin/* obj/*
