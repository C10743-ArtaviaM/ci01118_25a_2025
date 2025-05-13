SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin

# Nombre del programa principal (sin extensión)
NAME = main

ASM_SRC = $(SRC_DIR)/$(NAME).asm
OBJ = $(BUILD_DIR)/$(NAME).o
EXE = $(BIN_DIR)/$(NAME)

run: $(EXE)
	./$(EXE)

$(OBJ): $(ASM_SRC)
	mkdir -p $(BUILD_DIR)
	nasm -f elf32 $< -o $@

$(EXE): $(OBJ)
	mkdir -p $(BIN_DIR)
	ld -m elf_i386 -o $@ $<

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)
