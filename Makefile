#use docker compose built --no-cache 
CONTAINERS = my_nginx 
#my_wordpress

all:
	sudo docker compose -p inception -f srcs/docker-compose.yml build --no-cache
	sudo docker compose -p inception -f srcs/docker-compose.yml up -d

enter:
	sudo docker exec -it my_nginx /bin/sh

stop :
	sudo docker stop $(CONTAINERS)

down : stop
	sudo docker compose -p inception -f srcs/docker-compose.yml down

clean : down
	sudo docker system prune

fclean: down
	sudo docker system prune -a -f

re: fclean all

.PHONY:	all stop clean fclean re