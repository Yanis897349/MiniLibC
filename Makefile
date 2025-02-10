##
## EPITECH PROJECT, 2025
## MiniLibC
## File description:
## Makefile
##

CC = gcc
CXX = g++
ASM = nasm
RM = rm -f

CXXFLAGS = -Wall -Wextra -Werror -std=c++20 -fno-builtin

ASMFLAGS = -f elf64
LDFLAGS = -shared

LIB_NAME = libasm.so
TEST_NAME = tester

ASM_SRCS = strlen.asm \
					 strchr.asm \
					 memset.asm \
					 memcpy.asm \
					 strrchr.asm \
					 strcmp.asm \
					 memmove.asm \
					 strncmp.asm \
					 strcasecmp.asm \
					 strstr.asm \
					 strpbrk.asm \
					 strcspn.asm
ASM_OBJS = $(ASM_SRCS:.asm=.o)

TEST_SRC = test.cpp

all: $(LIB_NAME)

$(LIB_NAME): $(ASM_OBJS)
	$(CC) $(LDFLAGS) -o $@ $(ASM_OBJS)

$(TEST_NAME): $(TEST_SRC) $(LIB_NAME)
	$(CXX) $(CXXFLAGS) -o $@ $(TEST_SRC) -L. -lasm

%.o: %.asm
	$(ASM) $(ASMFLAGS) $< -o $@

clean:
	$(RM) $(ASM_OBJS)

fclean: clean
	$(RM) $(LIB_NAME) $(TEST_NAME)

re: fclean all

tests: $(TEST_NAME)
	LD_PRELOAD=./$(LIB_NAME) ./$(TEST_NAME)

.PHONY: all clean fclean re tests
