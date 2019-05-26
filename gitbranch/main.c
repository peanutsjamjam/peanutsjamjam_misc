#include <stdio.h>

int main(int argc, char **argv) {
	FILE *in;
	char s[128];
	size_t i;

	in = popen("git branch --no-color 2> /dev/null", "r");

	while ( fgets(s, sizeof(s), in) )
		if (s[0] == '*' && s[1] == ' ')
			for (i=2; i<128 ; i++)
				if (s[i] == 0x0a) {
					s[i] = 0;
					goto END;
				}
	s[2] = 0;
END:
	pclose(in);

	if (s[2] != 0) {
		printf(" %s", s+2);
	}

	return 0;
}
