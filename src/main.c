#include <stdio.h>
#include <stdlib.h>

size_t ft_strlen(char *);
size_t ft_strcpy(char*,char *);


int main(void) {
	char *one = malloc(5 + 1);

	printf("%p\n", ft_strcpy(one, "Anezka"));
	printf("%p\n", one);
}