
#include <stdio.h>
#include <stdlib.h>

int max_diff(int a, int b, int c, int d) ;

int main(){
	printf("%d\n", max_diff(1, 2, 3, 4));
	printf("%d\n", max_diff(-1, 2, 3, 4));
	printf("%d\n", max_diff(4, 8, 16, 15));
	printf("%d\n", max_diff(42, 23, 42, 15));
}