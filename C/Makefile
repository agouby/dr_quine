# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agouby <agouby@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/12 23:34:09 by agouby            #+#    #+#              #
#    Updated: 2018/02/11 04:28:53 by agouby           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	dr_quine
EXECS		=	Colleen \
		  		Grace \
		 		Sully

CC			= clang
FLAGS		= -Wall -Werror -Wextra

SRC_FOLDER	= ./srcs/
OBJ_FOLDER	= ./builds/

SRC_CREATE	= $(addsuffix .c, $(EXECS))
SRCS		= $(addprefix $(SRC_FOLDER), $(SRC_CREATE))
OBJS		= $(addprefix $(OBJ_FOLDER), $(SRC_CREATE:.c=.o))

all: $(NAME) $(EXECS)

$(NAME): $(OBJ_FOLDER) $(OBJS)

%: $(OBJ_FOLDER)%.o
	@$(CC) $(FLAGS) -o $@ $<

$(OBJ_FOLDER):
	@mkdir -p $(OBJ_FOLDER)
	@printf "\e[36mCompiling the project:\n\n"

$(OBJ_FOLDER)%.o: $(SRC_FOLDER)%.c
	@$(CC) $(FLAGS) -c $< -o $@
	@printf "\e[33mCompiling $(subst .c,,$(subst srcs/,,$<))\n"

clean:
	@printf "\e[91mCleaning $(OBJ_FOLDER)\n"
	@rm -rf $(OBJ_FOLDER)

fclean: clean
	@printf "\e[91mCleaning executables\n"
	@printf "\e[91mCleaning all generated files\n"
	@rm -rf $(EXECS)
	@rm -rf Grace_kid.c
	@find . -name "Sully_*" | xargs rm -rf

re: fclean
	@printf "\n"
	@make all

.PHONY: all re fclean clean
