# Create
eksctl create fargateprofile \
  --cluster eksworkshop-eksctl \
  --name 2048-game \
  --namespace 2048-game


# Check Fargate Profile
eksctl get fargateprofile \
  --cluster eksworkshop-eksctl \
  -o yaml

# Apply 2048 Game
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/2048/2048-namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/2048/2048-deployment.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/2048/2048-service.yaml


kubectl -n 2048-game rollout status deployment 2048-deployment

# Setup OIDC Provider
eksctl utils associate-iam-oidc-provider \
  --cluster eksworkshop-eksctl \
  --region=$AWS_REGION \
  --approve

#   Setup ingress policy
aws iam create-policy \
  --policy-name ALBIngressControllerIAMPolicy \
  --policy-document https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/iam-policy.json

# Create Service Account for Fargate
export FARGATE_POLICY_ARN=$(aws iam list-policies --query 'Policies[?PolicyName==`ALBIngressControllerIAMPolicy`].Arn' --output text)

eksctl create iamserviceaccount \
  --name alb-ingress-controller \
  --namespace 2048-game \
  --cluster eksworkshop-eksctl \
  --attach-policy-arn ${FARGATE_POLICY_ARN} \
  --approve \
  --override-existing-serviceaccounts

# Check the SA created
kubectl get sa alb-ingress-controller -n 2048-game -o yaml

# Create RBAC ROle
curl -sS  https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/rbac-role.yaml \
  | sed 's/namespace: kube-system/namespace: 2048-game/g' \
  | kubectl apply -f -

kubectl describe clusterrole alb-ingress-controller
kubectl describe clusterrolebinding alb-ingress-controller

# Install Ingress COntroller through helm
helm version
helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator

# Get the VPC ID
export VPC_ID=$(aws eks describe-cluster --name eksworkshop-eksctl --query "cluster.resourcesVpcConfig.vpcId" --output text)

helm --namespace 2048-game install 2048-game \
  incubator/aws-alb-ingress-controller \
  --set image.tag=${ALB_INGRESS_VERSION} \
  --set awsRegion=${AWS_REGION} \
  --set awsVpcID=${VPC_ID} \
  --set rbac.create=false \
  --set rbac.serviceAccount.name=alb-ingress-controller \
  --set clusterName=eksworkshop-eksctl

  kubectl -n 2048-game rollout status \
  deployment 2048-game-aws-alb-ingress-controller

  kubectl get pods -n 2048-game

  curl -s https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/2048/2048-ingress.yaml \
    | yq w  - 'metadata.annotations."alb.ingress.kubernetes.io/target-type"' ip \
    | kubectl apply -f -


  export ALB_ADDRESS=$(kubectl get ingress -n 2048-game -o json | jq -r '.items[].status.loadBalancer.ingress[].hostname')

echo "http://${ALB_ADDRESS}"


# Cleaning up

# Delete ingress
kubectl delete -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/2048/2048-ingress.yaml
# Delete service
kubectl delete -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/2048/2048-service.yaml

# Delete deployment
kubectl delete -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/2048/2048-deployment.yaml

# Delete alb-ingress-gateway
helm -n 2048-game delete 2048-game


# Delete service account
eksctl delete iamserviceaccount \
  --name alb-ingress-controller \
  --namespace 2048-game \
  --cluster eksworkshop-eksctl \
  --wait

  # Delete Kubernetes RBAC
curl -sS  https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/rbac-role.yaml \
  | sed 's/namespace: kube-system/namespace: 2048-game/g' \
  | kubectl delete -f -

  
# Delete Fargate profile
eksctl delete fargateprofile \
  --name 2048-game \
  --cluster eksworkshop-eksctl
  -wait
  
# Delete namespace
kubectl delete -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/2048/2048-namespace.yaml

# Delete IAM policy
aws iam delete-policy --policy-arn $FARGATE_POLICY_ARN