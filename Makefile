# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agouby <agouby@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/12 23:34:09 by agouby            #+#    #+#              #
#    Updated: 2018/01/12 23:34:11 by agouby           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= dr_quine
EXECS		= Colleen \
		  Grace \
		  Sully

CC		= clang
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

$(OBJ_FOLDER)%.o: $(SRC_FOLDER)%.c
	@$(CC) $(FLAGS) -c $< -o $@

clean:
	@rm -rf $(OBJ_FOLDER)

fclean: clean
	@rm -rf $(EXECS)
	@rm -rf Grace_kid.c
	@find . -name "S*" | grep "_" | xargs rm -rf

re: fclean all
