# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ael-khel <ael-khel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/16 05:26:22 by ael-khel          #+#    #+#              #
#    Updated: 2025/01/20 00:59:49 by ael-khel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#----------------------------- Colors Variables -------------------------------#

RED					= \033[0;31m
GREEN				= \033[0;32m
NC					= \033[0m

#----------------------------- Docker Variables -------------------------------#

DOCKER				= docker
DOCKER_COMPOSE		= docker compose
COMPOSE_FILE		= srcs/compose.yaml

WP_VOLUME_DIR		=/home/${USER}/data/wordpress_files
DB_VOLUME_DIR		=/home/${USER}/data/database_files

#---------------------------------- Rules -------------------------------------#

all: up

up: build
	@mkdir -p $(WP_VOLUME_DIR) $(DB_VOLUME_DIR)
	@echo "$(GREEN)Volumes Directories created successfully!$(NC)"
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d
	@echo "$(GREEN)Containers are up and running$(NC)"

build:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) build
	@echo "$(GREEN)Containers are built$(NC)"

down:
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down
	@echo "$(RED)Containers are removed$(NC)"

clean: 
	@$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down -v --rmi all
	@echo "$(RED)Containers and images and volumes are removed$(NC)"

fclean: clean
	@$(RM) -rf $(WP_VOLUME_DIR) $(DB_VOLUME_DIR) 
	@echo "$(RED)Volumes Directories are removed$(NC)"


