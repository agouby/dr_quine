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

SRC_FOLDER	= ./srcs/
SRC_FILES	= Colleen.c \
		  Grace.c \
		  Sully.c

SRCS		= $(addprefix $(SRC_FOLDER), $(SRC_FILES))
OBJS		= $(addprefix $(OBJ_DIR), $(SRCS=.c:.o))

all: $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY)

%.o: %.c
	mkdir -p $(OBJ_DIR)
	$(CC) $(FLAGS) -o $< -c $@
