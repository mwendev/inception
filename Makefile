NAME	= inception
SRCS	= ./srcs

# .SILENT:
$(NAME):	$(SRCS)
	mkdir -p /home/mwen/data/database
	mkdir -p /home/mwen/data/wordpress
	docker system prune -f
	docker compose --project-directory $(SRCS) up

all:	$(NAME)

clean:
	docker compose --project-directory $(SRCS) down
	docker rmi -f $$(docker images -qa)
	docker volume rm $$(docker volume ls -q)
	-docker network rm $$(docker network ls -q)

fclean:
	clean
	rm -rf /home/mwen/data

domain:
	echo "Need admin to add domain to /etc/hosts file"
	sudo echo "127.0.0.1 mwen.42.fr" >> /etc/hosts