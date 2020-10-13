# Docker Basics
**1. Check the docker client and server version**

	docker version 

**2. Run a sample docker container of nginx**

    docker pull nginx:latest
    docker images
    docker run -d -p 80:80 --name nginx nginx:latest
    docker ps
    curl http://localhost:8080

**3. Check the logs and log into the container for updating**

    docker logs nginx
    docker logs nginx -f
    docker exec -it nginx /bin/bash
    echo  "<h1>My New HTML File<h1>" > /usr/share/nginx/html/myfile.html
    exit
    curl http://localhost:8080

**4. Stop and remove docker container and image**

    docker stop nginx
    docker rm nginx
    docker rmi nginx:latest

**5. Short cut for removing all running containers**

    docker container stop $(docker container ls -aq)
    docker rm $(docker container ls -aq)    

