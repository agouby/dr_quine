# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: agouby <agouby@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/01/12 23:34:09 by agouby            #+#    #+#              #
#    Updated: 2018/02/09 08:55:45 by agouby           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	make -C C
	make -C ASM

clean:
	make clean -C C
	make clean -C ASM

fclean:
	make fclean -C C
	make fclean -C ASM

re:
	make re -C C
	make re -C ASM
