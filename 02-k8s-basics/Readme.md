# Basic Kubernetes

**1. Configure and connect kubectl**

    Alias kubectl, check version and config file
    alias k=kubectl
    kubectl version
    nano ~/.kube/config

**2. Create Sample Deployment and Scale**

    k create deployment nginx --image=nginx
    k get deployments
    k describe deployments
    k describe pods
    k describe replicasets
    k scale --replicas=3 deployment/nginx  

**3.  Expose a service locally in cluster ip**

    k expose deployment nginx --port=80 --target-port=80 --name nginx
    k run curl --image=radial/busyboxplus:curl -i --tty
    k delete svc nginx

  **4. Expose Service on a Node port**

    k expose deployment nginx --port=80 --target-port=80 --name nginx --type=NodePort
    k get svc -o wide
    k delete svc nginx

  **5. Expose through Load Balancer**

    k expose deployment nginx --port=80 --target-port=80 --name nginx --type=LoadBalancer
    k get svc -o wide
    k delete svc nginx
  
> Expose through ALB -- See in EKS Section

**6. Export the deployment and service to file**

    k get service/nginx deployment/nginx --export=true -o yaml > nginx.yml
    k delete service/nginx deployment/nginx
    k apply -f nginx.yml

