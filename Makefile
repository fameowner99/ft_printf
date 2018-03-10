# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vmiachko <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/03/04 15:53:54 by vmiachko          #+#    #+#              #
#    Updated: 2018/03/10 15:33:12 by vmiachko         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

RM = rm -f

SRC = convert_to_another_base ft_itoa_for_ui ft_printf get_specifier \
		get_specifier1 hash parsing parsing1 \
		parsing_tools result_output parsing2 parsing_tools1 

CFILES = $(patsubst %, %.c, $(SRC))

OFILES = $(patsubst %, %.o, $(SRC))

INCLUDES = ./includes

CFLAGS = -Wall -Wextra -Werror 

LIB_DIR = ./libft/

LIB_FILES = ft_strncpy \
			ft_realloc \
			ft_memalloc \
			ft_memcpy \
			ft_strlen \
			ft_memset \
			ft_atoi \
			ft_itoa \
			ft_count_digits \
			ft_putstr \
			ft_putchar \
			ft_strcpy \
			ft_decode \
			ft_strjoin \
			ft_strnew \
			ft_strcmp \
			ft_putstr_fixed_size \
			ft_realloc_fixed_size \
			ft_strdup

LIB_CFILES = $(patsubst %, $(LIB_DIR)%.c, $(LIB_FILES))

LIB_OFILES = $(patsubst %, %.o, $(LIB_FILES))

LIB_INC = -I $(LIB_DIR)includes/

all : $(NAME)

$(NAME) : $(OFILES)
	make -C $(LIB_DIR)
	ar rc $(NAME) $(OFILES) $(LIB_OFILES)
	ranlib $(NAME)

$(OFILES) :
	gcc $(CFLAGS) -c -I $(INCLUDES) $(LIB_INC) $(LIB_CFILES) $(CFILES)

clean :
	make -C $(LIB_DIR) clean
	$(RM) $(OFILES)
	$(RM) $(LIB_OFILES)

fclean : clean
	make -C $(LIB_DIR) fclean
	$(RM) $(NAME)

re : fclean all

.PHONY: all clean fclean re
