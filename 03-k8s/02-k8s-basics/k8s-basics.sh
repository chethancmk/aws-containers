    kubectl version
    kubectl create deployment nginx  --image=nginx
    kubectl describe deployments
    kubectl describe pods
    kubectl get pods -o wide
    kubectl describe replicasets

# A Deployment creates/manages ReplicaSet(s) which, in turn, creates the required Pod(s)
    kubectl scale --replicas=3 deployment/nginx
    kubectl get pods -o wide
    kubectl run my-shell --rm -i --tty --image ubuntu -- bash
        apt update; apt install curl -y
        curl http://10.10.124.82
        
# Service
    kubectl expose deployment nginx --port=80 --target-port=80 --name nginx --type=LoadBalancer
    kubectl get services
    kubectl logs -lapp=nginx

    kubectl run my-shell --rm -i --tty --image ubuntu -- bash
    apt update; apt install curl -y
    curl http://nginx

# Backup Deployment and Delete
    kubectl get service/nginx deployment/nginx --export=true -o yaml > nginx.yml
    kubectl delete service/nginx deployment/nginx
    kubectl apply -f nginx.yml


