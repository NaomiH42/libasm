#include <stddef.h>
#include <stdio.h>
#include <errno.h> 
#include <string.h>
#include <fcntl.h>
#include <stdlib.h>

extern size_t ft_strlen(char *);
extern char* ft_strcpy(char*,char *);
extern size_t ft_strcmp(char*,char*);
extern __ssize_t ft_write(int, char*, size_t);
extern __ssize_t ft_read(int, char*, size_t);
extern char *ft_strdup(char*);

int main(void) {
	size_t len;
	
	printf("strlen:\n");
	len = ft_strlen("42");
	printf("	42 - %d\n", len);

	len = ft_strlen("12345");
	printf("	1245 - %d\n", len);

	len = ft_strlen("");
	printf("	(empty) - %d\n\n", len);


	char dest[10];
	char *src = "42";
	printf("strcpy:\n");
	char *ret = ft_strcpy(dest, src);
	printf("	Src: %s Dst: %s return: %s\n\n", src, dest, ret);


	printf("strcmp:\n");
	size_t compare1 = ft_strcmp("test", "test");
	size_t compare2 = ft_strcmp("test", "test5");
	size_t compare3 = ft_strcmp("test5", "test");
	printf("	test, test | %d\n", compare1);
	printf("	test, test5 | %d\n", compare2);
	printf("	test5, test | %d\n\n", compare3);


	printf("write:\n");
	fflush(stdout);
	__ssize_t bytes_read = ft_write(1, "	hello\n", 7);
	printf("	Error: %d\n", errno);
	printf("	Bytes read: %d\n\n", bytes_read);

	bytes_read = ft_write(-1, "	hello\n", 7);
	printf("	Error: %d\n", errno);
	printf("	Bytes read: %d\n\n", bytes_read);
	

	printf("write:\n");
	char *buff;
	buff = calloc(1, 11);
	__ssize_t bytes_written = ft_read(0, buff, 10);
	fflush(stdout);
	printf("	Error: %d\n", errno);
	printf("	Bytes written: %d\n", bytes_written);
	printf("	Buffer: %s\n\n", buff);
	free(buff);
	fflush(stdout);

	char buff2[20];
	bytes_written = ft_read(-1, buff2, 10);
	printf("	Error: %d\n", errno);
	printf("	Bytes written: %d\n\n", bytes_written);
	// printf("	Buffer: %s\n\n", buff2);

	printf("strdup:\n");
	char *dupped = ft_strdup("Hi");
	printf("	Error: %d\n", errno);
	printf("	Orig: Hi, Dupped: %s\n", dupped);
	free(dupped);

}