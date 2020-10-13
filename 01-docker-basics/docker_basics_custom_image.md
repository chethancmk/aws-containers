
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
    curl http://localhost:8090

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

    docker rmi chethancmk/svca
    docker rmi svca
    docker pull chethancmk/svca

