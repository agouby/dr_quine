# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agouby <agouby@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/12 23:34:09 by agouby            #+#    #+#              #
#    Updated: 2019/03/05 18:10:08 by agouby           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_COLLEEN =	Colleen
NAME_GRACE =	Grace
NAME_SULLY =	Sully

CC			= gcc
FLAGS		= -Wall -Werror -Wextra

SRC_FOLDER	= ./srcs/
OBJ_FOLDER	= ./builds/

SRC_CREATE	= $(addsuffix .c, $(NAME))
SRCS		= $(addprefix $(SRC_FOLDER), $(SRC_CREATE))
OBJS		= $(addprefix $(OBJ_FOLDER), $(SRC_CREATE:.c=.o))

all: $(OBJ_FOLDER) $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY)

$(NAME_COLLEEN): $(OBJ_FOLDER)Colleen.o
	@printf "\e[33mCompiling Colleen\n"
	@$(CC) $(FLAGS) -o $@ $<

$(NAME_GRACE): $(OBJ_FOLDER)Grace.o
	@printf "\e[33mCompiling Grace\n"
	@$(CC) $(FLAGS) -o $@ $<

$(NAME_SULLY): $(OBJ_FOLDER)Sully.o
	@printf "\e[33mCompiling Sully\n"
	@$(CC) $(FLAGS) -o $@ $<

$(OBJ_FOLDER):
	@mkdir -p $(OBJ_FOLDER)
	@printf "\e[36mCompiling the project:\n"

$(OBJ_FOLDER)%.o: $(SRC_FOLDER)%.c
	@$(CC) $(FLAGS) -c $< -o $@

clean:
	@printf "\e[91mCleaning $(OBJ_FOLDER)\n"
	@rm -rf $(OBJ_FOLDER)

fclean: clean
	@printf "\e[91mCleaning executables\n"
	@printf "\e[91mCleaning all generated files\n"
	@rm -rf $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY)
	@rm -rf Grace_kid.c
	@find . -name "Sully_*" | xargs rm -rf

re: fclean all

.PHONY: all re fclean clean
