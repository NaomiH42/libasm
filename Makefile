SRC_F = src
OBJ_F = obj

SRC = 	$(SRC_F)/ft_strlen.s \
		$(SRC_F)/ft_strcpy.s

OBJ = $(patsubst $(SRC_F)/%.s, $(OBJ_F)/%.o, $(SRC))

MAIN = $(SRC_F)/main.c

CC = cc
AS = nasm -felf64

TARGET = main

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(MAIN) $^ -o $@

$(OBJ_F)/%.o: $(SRC_F)/%.s | $(OBJ_F)
	$(AS) $< -o $@

$(OBJ_F):
	mkdir -p $(OBJ_F)

clean:
	rm -rf $(OBJ_F)

fclean: clean
	rm -f $(TARGET)

.PHONY: all clean
