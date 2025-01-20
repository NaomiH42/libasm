#include <stddef.h>
#include <stdio.h>
#include <errno.h> 
#include <string.h>
#include <fcntl.h>

size_t ft_strlen(char *);
size_t ft_strcpy(char*,char *);
size_t ft_strcmp(char*,char*);
size_t ft_write(int, char*, size_t);

int main(void) {
	// int fd = open("a", O_WRONLY | O_CREAT | O_TRUNC, 0644);
	int fd = open("a", O_RDONLY);
	int ret = ft_write(fd, "hello", 5);
	printf("%s\n", strerror(errno));
	printf("%d\n", ret);

	ret = ft_write(1, "hello", 5);
	printf("%s\n", strerror(errno));
	printf("%d\n", ret);

	ret = ft_write(-1, "hello", 5);
	printf("%s\n", strerror(errno));
	printf("%d\n", ret);
}