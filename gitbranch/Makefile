
CC = gcc
CFLAGS += -pipe -Wall

gitbranch: main.o
	${CC} ${CFLAGS} -o $@ $^

install: gitbranch
	cp gitbranch ~/bin

clean:
	rm -f gitbranch *.o
