# https://github.com/weaveworks/eksctl/tree/master/examples

eksctl create cluster -f eksworkshop.yaml


kubectl get nodes # if we see our 3 nodes, we know we have authenticated correctly


# Copy the Stack Name for later use
STACK_NAME=$(eksctl get nodegroup --cluster eksworkshop-eksctl -o json | jq -r '.[].StackName')
ROLE_NAME=$(aws cloudformation describe-stack-resources --stack-name $STACK_NAME | jq -r '.StackResources[] | select(.ResourceType=="AWS::IAM::Role") | .PhysicalResourceId')
echo "export ROLE_NAME=${ROLE_NAME}" | tee -a ~/.bash_profile

# Generate Kubeconfig
# https://aws.amazon.com/premiumsupport/knowledge-center/eks-cluster-connection/
aws eks --region region update-kubeconfig --name eksworkshop-eksctl

kubectl get svc
