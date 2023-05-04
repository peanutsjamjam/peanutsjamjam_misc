
CFLAGS += -pipe -Wall

gitbranch: main.o
	${CC} ${CFLAGS} -o $@ $^

install: gitbranch
	install gitbranch ~/bin

clean:
	rm -f gitbranch *.o
