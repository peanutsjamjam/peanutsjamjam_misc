
CFLAGS += -pipe -Wall

gitbranch: main.o
	${CC} ${CFLAGS} -o $@ $^

install: gitbranch
	install -D -t ~/bin gitbranch

clean:
	rm -f gitbranch *.o
