# https://github.com/weaveworks/eksctl/tree/master/examples

# 1 Create a EKS Cluster
eksctl create cluster -f eksworkshop.yaml

# 2 Generate Kubeconfig for connection
# https://aws.amazon.com/premiumsupport/knowledge-center/eks-cluster-connection/


## kubectl config context
nano ~/.kube/config
mv ~/.kube/config  ~/.kube/config_bkp
aws eks --region ap-south-1 update-kubeconfig --name eksworkshop-eksctl-upg

k config get-contexts
k config use-context arn:aws:eks:ap-south-1:895300689201:cluster/eksworkshop-eksctl-upg
k config delete-context arn:aws:eks:ap-south-1:895300689201:cluster/eksworkshop-eksctl-upg
<!-- Get the cluster name -->
k cluster-info dump | grep cluster-name


# 3 Default user Access to the Cluster
kubectl get configmap aws-auth -n kube-system -o yaml > aws-auth.yaml
kubectl auth can-i get pods
kubectl auth can-i "*" "*"
## Additional User Access : https://aws.amazon.com/premiumsupport/knowledge-center/amazon-eks-cluster-access/
## https://www.freecodecamp.org/news/adding-limited-access-iam-user-to-eks-cluster/
## https://www.eksworkshop.com/beginner/091_iam-groups/configure-aws-auth/
aws sts assume-role --role-arn "arn:aws:iam::895300689201:role/eks-dev" --role-session-name eks-dev

export AWS_ACCESS_KEY_ID=RoleAccessKeyID
export AWS_SECRET_ACCESS_KEY=RoleSecretKey
export AWS_SESSION_TOKEN=RoleSessionToken

### Check the role has been assigned
aws sts get-caller-identity
k get nodes
k get pods
### Switch Back to the cluster admin
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN


# 4 Upgrade Cluster
## Check the updates available
aws eks list-clusters
aws eks describe-cluster  --name eksworkshop-eksctl-upg
aws eks list-updates --name eksworkshop-eksctl-upg

# Upgrade cluster
eksctl upgrade cluster --name=eksworkshop-eksctl-upg --approve

# Upgrade Node Group by creating new nodegroup - Managed/Launch Template
eksctl get nodegroup --eksworkshop-eksctl-upg
eksctl upgrade nodegroup --name= t3-managed-ng --cluster=eksworkshop-eksctl-upg --kubernetes-version=1.16

<!-- eksctl create nodegroup --cluster=eksworkshop-eksctl-upg  --name=<newNodeGroupName> -->
<!-- eksctl upgrade nodegroup --name=managed-ng-1 --cluster=managed-cluster --launch-template-version=3 -->

# Upgrade the Add-Ons
eksctl utils update-kube-proxy --cluster=eksworkshop-eksctl-upg --approve
eksctl utils update-aws-node --cluster=eksworkshop-eksctl-upg --approve
eksctl utils update-coredns --cluster=eksworkshop-eksctl-upg --approve

# Convert Files if required
kubectl convert -f ./<my-deployment.yaml> --output-version apps/v1


# Copy the Role Name for later use
STACK_NAME=$(eksctl get nodegroup --cluster eksworkshop-eksctl -o json | jq -r '.[].StackName')
ROLE_NAME=$(aws cloudformation describe-stack-resources --stack-name $STACK_NAME | jq -r '.StackResources[] | select(.ResourceType=="AWS::IAM::Role") | .PhysicalResourceId')
echo "export ROLE_NAME=${ROLE_NAME}" | tee -a ~/.bash_profile
