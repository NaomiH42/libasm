SRC_D = src
OBJ_D = obj

SRC_A = 	$(SRC_D)/ft_strlen.s \
		$(SRC_D)/ft_strcpy.s \
		$(SRC_D)/ft_strcmp.s \
		$(SRC_D)/ft_write.s \
		$(SRC_D)/ft_read.s \
		$(SRC_D)/ft_strdup.s

SRC_C = $(SRC_D)/main.c

OBJ_S = $(patsubst $(SRC_D)/%.s, $(OBJ_D)/%.o, $(SRC_A))
OBJ_C = $(patsubst $(SRC_D)/%.c, $(OBJ_D)/%.o, $(SRC_C))

OBJ = $(OBJ_S) $(OBJ_C)

MAIN = $(SRC_D)/main.c

CC = cc -g
AS = nasm -felf64

TARGET = libasm.a

all: $(TARGET)

test: $(OBJ_C) $(TARGET) 
	$(CC) $(OBJ_C) -L. -lasm -o $@

$(TARGET): $(OBJ_S)
	ar rc $@ $^

$(OBJ_D)/%.o: $(SRC_D)/%.s | $(OBJ_D)
	$(AS) $< -o $@

$(OBJ_D)/%.o: $(SRC_D)/%.c | $(OBJ_D)
	$(CC) $< -c -o $@

$(OBJ_D):
	mkdir -p $(OBJ_D)

re: fclean all

clean:
	rm -rf $(OBJ_D)

fclean: clean
	rm -f $(TARGET)
	rm -f test

.PHONY: all clean fclean re
