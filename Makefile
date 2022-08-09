NAME	= inception
SRCS	= ./srcs/docker-compose.yml

.SILENT:
$(NAME):	$(SRCS) domain
	mkdir -p /home/mwen/data
	docker system prune -f
	docker compose -f $(SRCS) up --build -d

all:	$(NAME)

clean:
	docker compose -f $(SRCS) down
	docker rmi -f $$(docker images -qa)
	docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls -q)

fclean:
	rm -rf /home/mwen/data

domain:
	echo "Need admin to add domain to /etc/hosts file"
	sudo echo "127.0.0.1 mwen.42.fr" >> /etc/hosts