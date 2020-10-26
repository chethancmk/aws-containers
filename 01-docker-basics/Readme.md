# Docker Basics
**1. Check the docker client and server version**

	docker version 

**2. Run a sample docker container of nginx**

    docker pull nginx:latest
    docker images
    docker run -d -p 80:80 --name nginx nginx:latest
    docker ps
    curl http://localhost:80 | grep Welcome
    watch netstat -an | grep 80

**3. Check the logs and log into the container for updating**

    docker logs nginx
    docker logs nginx -f
    docker exec -it nginx /bin/bash
    echo  "<h1>My New HTML File<h1>" > /usr/share/nginx/html/index.html
    exit
    curl http://localhost:8080

**4. Stop and remove docker container and image**

    docker stop nginx
    docker rm nginx
    docker rmi nginx:latest

**5. Short cut for removing all running containers**

    docker container stop $(docker container ls -aq)
    docker rm $(docker container ls -aq)    


# Custom Docker Image
**1. Stop and remove previous containers**

    docker container stop $(docker container ls -aq)
    docker rm $(docker container ls -aq)
 
>  https://github.com/jasonumiker/docker-kube-intro-workshop.git

**2. Creating a custom DockerImage**

    cat Dockerfile
    docker build -t svca:latest .
    docker history svca:latest
    docker run -d -p 8090:80 --name svca svca:latest
    curl http://localhost:80
    docker dive svca:latest

**3. File System Mount for live changes**

    docker run -d -p 8090:80 -v $PWD/index.html:/usr/share/nginx/html/index.html:ro --name nginx nginx:latest
    curl http://localhost:8080
    docker stop nginx && docker rm nginx && docker rmi nginx

**4. Docker Push Command** 

> https://hub.docker.com/

    docker login
    docker tag svca chethancmk/svca
    docker push chethancmk/svca
  
**5. Pull custom image from hub**

    docker rmi chethancmk/svca1
    docker rmi svca
    docker pull chethancmk/svca1

