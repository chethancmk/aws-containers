
kubectl create ns my-nginx
kubectl -n my-nginx apply -f run-my-nginx.yaml
kubectl -n my-nginx get pods -o wide

# Get POD IP's
kubectl -n my-nginx get pods -o yaml | grep 'podIP:'

# Create Service
kubectl -n my-nginx expose deployment/my-nginx
kubectl -n my-nginx get svc my-nginx
kubectl -n my-nginx describe svc my-nginx

# Create a new deployment and allocate a TTY for the container in the pod
kubectl -n my-nginx run -i --tty busybox --image=busybox /bin/sh
wget -q -O - http://my-nginx | grep '<title>'
exit
kubectl delete deployment busybox  -n my-nginx 

# expose the service through loadbalancer
# kubectl -n my-nginx patch svc my-nginx -p '{"spec": {"type": "LoadBalancer"}}'
kubectl delete svc my-nginx -n  my-nginx
kubectl -n my-nginx expose deployment/my-nginx --type="LoadBalancer"
kubectl get svc -n my-nginx
kubectl -n my-nginx describe service my-nginx | grep Ingress


curl -k -s http://a1ebf19d6ce85448ebfa67fa4255abe0-102091156.ap-south-1.elb.amazonaws.com | grep title

# Create Ingress Controller
eksctl utils associate-iam-oidc-provider --cluster=eksworkshop-eksctl --approve
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/rbac-role.yaml
export PolicyARN=$(aws iam list-policies --query 'Policies[?PolicyName==`ALBIngressControllerIAMPolicy`].Arn' --output text)
eksctl create iamserviceaccount \
        --cluster=eksworkshop-eksctl \
        --namespace=kube-system \
        --name=alb-ingress-controller \
        --attach-policy-arn=$PolicyARN \
        --override-existing-serviceaccounts \
        --approve
        
# We dynamically replace the cluster-name by the name of our cluster before applying the YAML file
wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/alb-ingress-controller.yaml
# Remove Service Account and Update cluster name
kubectl apply -f alb-ingress-controller.yaml
kubectl logs -n kube-system $(kubectl get po -n kube-system | egrep -o "alb-ingress[a-zA-Z0-9-]+")


kubectl delete svc my-nginx -n my-nginx
kubectl expose deployment my-nginx -n my-nginx --type=NodePort
wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/2048/2048-ingress.yaml
# edit the ingress file for ns and service name
kubectl apply -f 2048-ingress.yaml


# clean up
  kubectl delete -f 2048-ingress.yaml
  kubectl delete -f alb-ingress-controller.yaml
  kubectl delete svc/my-nginx -n my-nginx
  kubectl delete deployment/my-nginx -n my-nginx
  kubectl delete ns my-nginx



