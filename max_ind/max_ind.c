
#include <stdio.h>
#include <stdlib.h>

int max_ind(int a, int b, int c, int d) ;

int main(){
	printf("%d\n", max_ind(8, 15, 16, 23));
	printf("%d\n", max_ind(42, 23, 16, 15));
	printf("%d\n", max_ind(4, 8, 16, 15));
	printf("%d\n", max_ind(42, 23, 42, 15));
}