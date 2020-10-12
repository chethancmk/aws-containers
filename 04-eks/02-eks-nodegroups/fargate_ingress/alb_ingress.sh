wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/rbac-role.yaml
wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/alb-ingress-controller.yaml

kubectl apply -f rbac-role.yaml
# Edit the ingress controller file to update the cluster name
kubectl apply -f alb-ingress-controller.yaml

# Check the logs of the deployment
kubectl logs -n kube-system $(kubectl get po -n kube-system | egrep -o "alb-ingress[a-zA-Z0-9-]+")

# Create the Fargate Profile
eksctl create fargateprofile -f ng_fargate.yaml

# Check the creation
eksctl get fargateprofile --cluster eksworkshop-eksctl

# Run Nginx in the Namespace
k run nginx --image nginx
k get pods
kubectl run curl --image=radial/busyboxplus:curl -i --tty