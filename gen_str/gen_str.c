
#include <stdio.h>
#include <stdlib.h>

char* gen_str(char *s, int c, int n, int inc) ;

int main(){
	char* buf = malloc(1000);

	printf("%s\n", gen_str(buf, 'a', 7, 0));
	printf("%s\n", gen_str(buf, 'b', 3, 1));
}