# ********************************* DEFINE CONTAINERS & IMAGES ********************************* #
CONTAINERS = $(shell docker ps -a -q)
IMAGES = $(shell docker images -qa)
VOLUMES = $(shell docker volume ls -q)
NETWORK = $(shell docker network ls -q)
# *********************************************************************************************** #


# ********************************* DEFINE COLORS ************************************************ #
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
NC = \033[0m
# *********************************************************************************************** #


# ********************************* DEFINE RULES ************************************************ #

all: create_data
	@docker compose -f ./srcs/docker-compose.yml up

create_data:
	@mkdir -p /home/youmoukh/data/wordpress
	@mkdir -p /home/youmoukh/data/mariadb


down:
	@docker compose  -f ./srcs/docker-compose.yml down



status:
	@echo "\n${YELLOW}~~~ Containers : ~~~${NC}"
	@docker ps
	@echo "${GREEN}~~~~~~~~~~~~~~~~~~~~\n${NC}"
	@echo "${RED}~~~~~ Images : ~~~~~${NC}"
	@docker images
	@echo "${GREEN}~~~~~~~~~END~~~~~~~~\n${NC}"


clean: down
	@rm -rf /home/youmoukh/data
	@rm -rf /home/youmoukh/data
	@if [ -n "$(CONTAINERS)" ]; then docker stop $(CONTAINERS); docker rm $(CONTAINERS); fi
	@if [ -n "$(IMAGES)" ]; then docker rmi -f $(IMAGES); fi
	@docker volume rm -f ${VOLUMES}
	@echo "${YELLOW}All Containers, Images, Network and Volumes have been removed.${NC}"



# *********************************************************************************************** #


# ********************************* DEFINE PHONY VARIABLES ************************************ #
.PHONY: clean run up down cleanV
# *********************************************************************************************** #