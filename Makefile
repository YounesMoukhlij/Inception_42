# ********************************* DEFINE CONTAINERS & IMAGES ********************************* #
CONTAINERS = $(shell docker ps -a -q)
IMAGES = $(shell docker images -qa)
# *********************************************************************************************** #


# ********************************* DEFINE COLORS ************************************************ #
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
NC = \033[0m
# *********************************************************************************************** #


# ********************************* DEFINE RULES ************************************************ #

all : credit
	@mkdir -p /home/${USER}/data/wordpress
	@mkdir -p /home/${USER}/data/mariadb
	@mkdir -p /home/${USER}/data/adminer
	@docker compose -f ./srcs/docker-compose.yml up
	@echo "\n\n${YELLOW}Nginx image has been built.\n${NC}"

credit :
	@echo "WELCOME\n"

run :
	@docker run -d -p 80:80 -p 443:443 --name nginx nginx
	@echo "\n\n${YELLOW}Nginx container has been started.\n${NC}"

status:
	@echo "\n${YELLOW}~~~ Containers : ~~~${NC}"
	@docker ps
	@echo "${GREEN}~~~~~~~~~~~~~~~~~~~~\n${NC}"
	@echo "${RED}~~~~~ Images : ~~~~~${NC}"
	@docker images
	@echo "${GREEN}~~~~~~~~~END~~~~~~~~\n${NC}"


clean:
	@if [ -n "$(CONTAINERS)" ]; then docker stop $(CONTAINERS); docker rm $(CONTAINERS); fi
	@if [ -n "$(IMAGES)" ]; then docker rmi -f $(IMAGES); fi
	@rm -rf /home/${USER}/data
	@docker volume rm ${docker volume ls -q}
	@echo "${YELLOW}All containers and images have been removed.${NC}"

# *********************************************************************************************** #


# ********************************* DEFINE PHONY VARIABLES ************************************ #
.PHONY: all clean
# *********************************************************************************************** #