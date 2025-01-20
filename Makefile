SRC_D = src
OBJ_D = obj

SRC_A = 	$(SRC_D)/ft_strlen.s \
		$(SRC_D)/ft_strcpy.s \
		$(SRC_D)/ft_strcmp.s \
		$(SRC_D)/ft_write.s

SRC_C = $(SRC_D)/main.c

OBJ_S = $(patsubst $(SRC_D)/%.s, $(OBJ_D)/%.o, $(SRC_A))
OBJ_C = $(patsubst $(SRC_D)/%.c, $(OBJ_D)/%.o, $(SRC_C))

OBJ = $(OBJ_S) $(OBJ_C)

MAIN = $(SRC_D)/main.c

CC = cc
AS = nasm -felf64

TARGET = main

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $^ -o $@

$(OBJ_D)/%.o: $(SRC_D)/%.s | $(OBJ_D)
	$(AS) $< -o $@

$(OBJ_D)/%.o: $(SRC_D)/%.c | $(OBJ_D)
	$(CC) $< -c -o $@

$(OBJ_D):
	mkdir -p $(OBJ_D)

clean:
	rm -rf $(OBJ_D)

fclean: clean
	rm -f $(TARGET)

.PHONY: all clean
