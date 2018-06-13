
#include <stdio.h>
#include <stdlib.h>

char* fun(char *s, char *a, char *b);

int main(){
	char* buf = malloc(1000);
	char* buf2 = malloc(1000);

	printf("%s\n", fun(buf, "bb", "uaaaaaaa"));
	printf("%s\n", fun(buf2, "abcdefgh", "123"));
}