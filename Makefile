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

NAME_COLLEEN	= Colleen
NAME_GRACE	= Grace
NAME_SULLY	= Sully

CC		= clang
FLAGS		= -Wall -Werror -Wextra

OBJ_DIR		= ./build/
SRC_DIR		= ./srcs/

SRC_FILES	= Colleen.c \
		  Grace.c \
		  Sully.c
SRCS		= $(addprefix $(SRC_FOLDER), $(SRC_FILES))
OBJS		= $(addprefix $(OBJ_DIR), $(SRCS=.c:.o))

all: $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY)

$(NAME_COLLEEN): $(addprefix $(NAME_COLLEEN), .o)
	$(CC) $(FLAGS) -o $(NAME_COLLEEN) $(addprefix $(OBJ_DIR), $<)

$(NAME_GRACE): $(addprefix $(NAME_GRACE), .o)
	$(CC) $(FLAGS) -o $(NAME_GRACE) $(addprefix $(OBJ_DIR), $<)

$(NAME_SULLY): $(addprefix $(NAME_SULLY), .o)
	$(CC) $(FLAGS) -o $(NAME_SULLY) $(addprefix $(OBJ_DIR), $<)

%.o: %.c
	mkdir -p $(OBJ_DIR)
	$(CC) -o $(addprefix $(OBJ_DIR), $@) -c $<
