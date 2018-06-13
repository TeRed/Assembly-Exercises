
#include <stdio.h>
#include <stdlib.h>

unsigned int check_tab(int *tab, int n, int *max);

int main(){
	int tab[5] = {1, 1, 1, 0, 2};
	int n = 5;
	int *max;
	max = malloc(sizeof(int));
	*max = 17;
	printf("%d\n", check_tab(tab, n, max));
	printf("%d\n", *max);
}