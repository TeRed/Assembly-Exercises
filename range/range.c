
#include <stdio.h>
#include <stdlib.h>

int range(int x, int a, int b, int c) ;

int main(){
	printf("%d\n", range(0, 0, 5, 10));
	printf("%d\n", range(3, 0, 5, 10));
	printf("%d\n", range(5, 0, 5, 10));
	printf("%d\n", range(7, 0, 5, 10));
	printf("%d\n", range(10, 0, 5, 10));
	printf("%d\n", range(16, 0, 5, 10));
}