# https://labs.awscontainerday.com/eks/x-ray.html
wget https://eksworkshop.com/intermediate/245_x-ray/daemonset.files/xray-k8s-daemonset.yaml
kubectl apply -f xray-k8s-daemonset.yaml
kubectl describe daemonset xray-daemon
kubectl get pod --selector app=xray-daemon
kubectl logs -l app=xray-daemon

# Deploy Microservice
kubectl apply -f https://eksworkshop.com/intermediate/245_x-ray/sample-front.files/x-ray-sample-front-k8s.yml
kubectl apply -f https://eksworkshop.com/intermediate/245_x-ray/sample-back.files/x-ray-sample-back-k8s.yml

# Check the services
kubectl describe deployments x-ray-sample-front-k8s x-ray-sample-back-k8s
kubectl describe services x-ray-sample-front-k8s x-ray-sample-back-k8s

kubectl get service x-ray-sample-front-k8s -o wide
# check the xray console

kubectl delete deployments x-ray-sample-front-k8s x-ray-sample-back-k8s
kubectl delete services x-ray-sample-front-k8s x-ray-sample-back-k8s

kubectl delete -f xray-k8s-daemonset.yaml

