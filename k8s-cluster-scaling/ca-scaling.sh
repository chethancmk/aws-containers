# Bind Identity Provider from Cluster
eksctl utils associate-iam-oidc-provider \
    --cluster eksworkshop-eksctl \
    --approve

# Create policy for Autoscaling
aws iam create-policy   \
  --policy-name k8s-asg-policy \
  --policy-document k8s-asg-policy.json
  
# Create Service Account with policy reference
eksctl create iamserviceaccount \
    --name cluster-autoscaler \
    --namespace kube-system \
    --cluster eksworkshop-eksctl \
    --attach-policy-arn "arn:aws:iam::${ACCOUNT_ID}:policy/k8s-asg-policy" \
    --approve \
    --override-existing-serviceaccounts
    
kubectl -n kube-system describe sa cluster-autoscaler


# Install Autoscaler
# Modify file - safe to evict, remove serviceaccount
wget https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml


kubectl apply -f cluster-autoscaler-autodiscover.yaml
kubectl logs -f deployment/cluster-autoscaler -n kube-system

# Simualte Load with NGINX
kubectl apply -f nginx.yaml
kubectl get deployment/nginx-to-scaleout
kubectl scale --replicas=20 deployment/nginx-to-scaleout
kubectl get pods -o wide --watch
kubectl logs -f deployment/cluster-autoscaler -n kube-system

# Cleanup
kubectl delete -f cluster-autoscaler-autodiscover.yaml
kubectl delete -f nginx.yaml

