alias k=kubectl
kubectl version
cd ~/.kube/
nano config

k create deployment nginx --image=nginx
k get deployments
k describe deployments
k describe pods
k describe replicasets
k scale --replicas=3 deployment/nginx

//Expose a service locally in cluster ip
k expose deployment nginx --port=80 --target-port=80 --name nginx
kubectl run curl --image=radial/busyboxplus:curl -i --tty
k delete svc nginx

//Expose Service on a Node port
k expose deployment nginx --port=80 --target-port=80 --name nginx --type=NodePort
k get svc -o wide
k delete svc nginx

//Expose through Load Balancer
k expose deployment nginx --port=80 --target-port=80 --name nginx --type=LoadBalancer
k get svc -o wide
k delete svc nginx

//Expose through ALB -- See in 07 ALB Section

//Export the service to file
kubectl get service/nginx deployment/nginx --export=true -o yaml > nginx.yml
kubectl delete service/nginx deployment/nginx
kubectl apply -f nginx.yml
