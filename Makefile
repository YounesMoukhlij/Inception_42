# ********************************* DEFINE CONTAINERS & IMAGES ********************************* #
CONTAINERS = $(shell docker ps -a -q)
IMAGES = $(shell docker images -qa)
VOLUMES = $(shell docker volume ls -q)
# *********************************************************************************************** #


# ********************************* DEFINE COLORS ************************************************ #
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
NC = \033[0m
# *********************************************************************************************** #


# ********************************* DEFINE RULES ************************************************ #

all : up
	@mkdir -p /home/${USER}/data/wordpress
	@mkdir -p /home/${USER}/data/mariadb
	@echo "\n\n${YELLOW}Nginx image has been built.\n${NC}"

up:
	@docker compose -f ./srcs/docker-compose.yml up

down:
	@docker compose down

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
	@rm -rf /home/${USER}/data
	@if [ -n "$(CONTAINERS)" ]; then docker stop $(CONTAINERS); docker rm $(CONTAINERS); fi
	@if [ -n "$(IMAGES)" ]; then docker rmi -f $(IMAGES); fi
	@echo "${YELLOW}All containers and images have been removed.${NC}"

cleanV:
	@docker volume rm -f ${VOLUMES}
	@docker network rm  -f $(VOLUMES)
	@echo "${YELLOW}All Volumes have been removed.${NC}"



# *********************************************************************************************** #


# ********************************* DEFINE PHONY VARIABLES ************************************ #
.PHONY: clean run up down cleanV
# *********************************************************************************************** #