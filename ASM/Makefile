# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agouby <agouby@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/12 23:34:09 by agouby            #+#    #+#              #
#    Updated: 2018/02/11 09:23:45 by agouby           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= dr_quine
EXECS		= Colleen \
			  Grace \
#			  Sully

MACOS_V		= $(shell uname -r)
ARCH		= $(shell uname -m)
LINKER		= ld
CC			= nasm
FLAGS		= -f macho64

SRC_FOLDER	= ./srcs/
OBJ_FOLDER	= ./builds/

SRC_CREATE	= $(addsuffix .s, $(EXECS))
SRCS		= $(addprefix $(SRC_FOLDER), $(SRC_CREATE))
OBJS		= $(addprefix $(OBJ_FOLDER), $(SRC_CREATE:.s=.o))


all: $(NAME) $(EXECS)

$(NAME): $(OBJ_FOLDER) $(OBJS)

%: $(OBJ_FOLDER)%.o
	@ld -o $@ $< -arch $(ARCH) -macosx_version_min $(MACOS_V) -lc
$(OBJ_FOLDER):
	@mkdir -p $(OBJ_FOLDER)

$(OBJ_FOLDER)%.o: $(SRC_FOLDER)%.s
	@$(CC) $(FLAGS) $< -o $@

clean:
	@rm -rf $(OBJ_FOLDER)

fclean: clean
	@rm -rf $(EXECS)
	@rm -rf Grace_kid.s
	@find . -name "S*" | grep "_" | xargs rm -rf

re: fclean all

.PHONY: all re fclean clean
