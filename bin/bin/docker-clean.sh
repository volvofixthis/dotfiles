docker ps -aq --no-trunc | xargs docker rm
docker images -q --filter dangling=true | xargs docker rmi
docker volume prune -f
docker image prune -a -f
docker system prune -a
