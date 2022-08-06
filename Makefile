NAME	= inception
SRCS	= ./srcs/docker-compose.yml

.SILENT:
$(NAME):	$(SRCS) domain
	mkdir -p /home/mwen/data
	docker system prune -f
	docker compose -f $(SRCS) up --build -d

all:	$(NAME)

clean:	$(SRCS)
	docker compose -f $(SRCS) down
	docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker network ls -q)
	docker rmi -f $$(docker images -qa)

domain:
	echo "Need admin to add domain to /etc/hosts file"
	sudo echo "127.0.0.1 mwen.42.fr" >> /etc/hosts