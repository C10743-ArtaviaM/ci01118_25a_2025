# Variables
ASM = nasm
ASMFLAGS = -f elf64

CC = gcc
CFLAGS = -Wall -Wextra -O2

# Estructura de carpetas
SRC_DIR = .
BUILD_DIR = build
BIN_DIR = bin

# Archivos fuente
ASM_SRC = $(SRC_DIR)/minmax.asm
C_SRC = $(SRC_DIR)/main.c

# Archivos objeto y ejecutable
ASM_OBJ = $(BUILD_DIR)/minmax.o
C_OBJ = $(BUILD_DIR)/main.o
TARGET = $(BIN_DIR)/main.out

# Regla principal
all: $(TARGET)

# Crear ejecutable
$(TARGET): $(ASM_OBJ) $(C_OBJ)
	@mkdir -p $(BIN_DIR)
	$(CC) -o $@ $^

# Compilar C
$(C_OBJ): $(C_SRC)
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Compilar ASM
$(ASM_OBJ): $(ASM_SRC)
	@mkdir -p $(BUILD_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

# Ejecutar
run: $(TARGET)
	./$(TARGET)

# Limpiar
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

.PHONY: all clean run
