CC=gcc
CFLAGS=-Wall -Iinclude

SRC=$(wildcard src/*.S)
OBJ=$(SRC:.S=.o)

all: libmylib.a

libmylib.a: $(OBJ)
	ar rcs $@ $(OBJ)

# Todo: Build C-prg
#gcc test/main.c -Iinclude -L. -lmylib -o testprog

#test/main.c – C-källkoden.
#-Iinclude – leta efter headers i include/.
#-L. – leta efter bibliotek i aktuell katalog.
#-lmylib – länka mot libmylib.a.
#-o testprog – skapa programmet testprog.