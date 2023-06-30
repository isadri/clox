CC := cc
CFLAGS := -Wall -Werror -Wextra -g
RM := rm -rf
INCLUDE := -I includes/
MAKEFLAGS := --no-print-directory

HEADERS := $(addprefix includes/,common.h chunk.h memory.h debug.h value.h vm.h)
SRC_DIR := src/

NAME := clox

SRCS := $(addprefix $(SRC_DIR),chunk.c memory.c debug.c value.c vm.c)

ALL_SRCS := main.c $(SRCS)
OBJS := $(ALL_SRCS:%.c=%.o)


$(NAME): $(OBJS)
	@$(CC) $(OBJS) -o $@
	@make clean

%.o: %.c $(HEADERS)
	@$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

clean:
	@$(RM) $(OBJS)
fclean: clean
	@$(RM) $(NAME)
re: fclean $(NAME)