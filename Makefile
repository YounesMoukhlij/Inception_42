
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
	@docker stop $(shell docker ps -aq) 2>/dev/null || true
	@docker rm $(shell docker ps -aq) 2>/dev/null || true
	@docker rmi -f $(shell docker images -q) 2>/dev/null || true
	@docker volume rm -f $(shell docker volume ls -q) 2>/dev/null || true
	@docker network rm -f $(shell docker network ls -q) 2>/dev/null || true
	@echo "${YELLOW}All Containers, Images, Network and Volumes have been removed.${NC}"




# *********************************************************************************************** #


# ********************************* DEFINE PHONY VARIABLES ************************************ #
.PHONY: clean run up down cleanV
# *********************************************************************************************** #