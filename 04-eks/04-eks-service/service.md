# Deployment/Pod/Replicaset
## Initial Configuration check
alias k=kubectl
kubectl version
cd ~/.kube/
nano config

## Create sample nginx/apache deployment
### Run just a pod and expose on port 80
kubectl run nginx --image nginx --restart=Never --port 80
kubectl get pod -o wide
kubectl run busybox --image radial/busyboxplus:curl --restart=Never -it --rm curl http://10.10.98.107
kubectl delete pod nginx

### Run as deployment with multiple pods
kubectl run nginx --image nginx --replicas 3
k get deployments nginx
k describe deployments nginx


# Services

## Expose a service locally in cluster ip
k expose deployment nginx --port=80 --target-port=80 --name nginx
kubectl run busybox --image radial/busyboxplus:curl --restart=Never -it --rm /bin/sh
curl http://nginx
nslookup nginx
exit
k delete svc nginx

## Expose Service on a Node port
k expose deployment nginx --port=80 --target-port=80 --name nginx --type=NodePort
k get svc -o wide
k get endpoints nginx
kubectl run curl --image=radial/busyboxplus:curl -i --tty
k delete svc nginx

## Expose Service through Loadbalancer
k expose deployment nginx --port=80 --target-port=80 --name nginx --type=LoadBalancer
k get svc -o wide
k delete svc nginx

## Export the service to file
kubectl get service/nginx deployment/nginx --export=true -o yaml > nginx.yml
kubectl delete service/nginx deployment/nginx
kubectl apply -f nginx.yml

## Expose through Ingress Controller ALB -- See in eks ingress section
