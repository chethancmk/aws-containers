
**0. Manual Cluster Creation**
    0. https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html
    1. Create Cluster Creation Role (eksClusterAdmin - Admin Policy)
    2. Create Cluster Role (eksClusterRole - AmazonEKSClusterPolicy)
    3. Create Cluster Node Role (eksNodeRole)
            AmazonEKSWorkerNodePolicy +  AmazonEKS_CNI_Policy + AmazonEC2ContainerRegistryReadOnly
    4. Deploy a VPC with atleast 2 Subnet
        https://amazon-eks.s3.us-west-2.amazonaws.com/cloudformation/2020-08-12/amazon-eks-vpc-private-subnets.yaml
    5. Optional : Create a KMS Key for Secrets Encryption
    6. Optional : ssh key pair
    6. Create cluster from console
    7. Install aws cli
    8. Install kubectl
    9. Create kubeconfig file
        aws eks --region ap-south-1 update-kubeconfig --name uipl18
    10. Install cluster Autoscaler


**1.  Create a EKS Cluster**

    eksctl create cluster -f eksworkshop_15.yaml    
    eksctl create cluster -f eksworkshop_17.yaml

> https://github.com/weaveworks/eksctl/tree/master/examples

**2 Generate Kube config for connection**

    nano ~/.kube/config
    mv ~/.kube/config ~/.kube/config_bkp
    aws eks --region ap-south-1 update-kubeconfig --name eksworkshop-eksctl-upg
    k config get-contexts
    k config use-context arn:aws:eks:ap-south-1:895300689201:cluster/eksworkshop-eksctl-upg
    k config delete-context arn:aws:eks:ap-south-1:895300689201:cluster/eksworkshop-eksctl-upg
    k cluster-info dump | grep cluster-name

> https://aws.amazon.com/premiumsupport/knowledge-center/eks-cluster-connection/

**3 Default user Access to the Cluster**

    kubectl get configmap aws-auth -n kube-system -o yaml > aws-auth.yaml
    kubectl auth can-i get pods
    kubectl auth can-i "*" "*"

**4. Additional User Access**

    aws sts assume-role --role-arn "arn:aws:iam::895300689201:role/eks-dev" --role-session-name eks-dev
    
    export AWS_ACCESS_KEY_ID=RoleAccessKeyID
    export AWS_SECRET_ACCESS_KEY=RoleSecretKey
    export AWS_SESSION_TOKEN=RoleSessionToken

> Check the role has been assigned

    aws sts get-caller-identity
    k get nodes
    k get pods

> Switch Back to the cluster admin

    unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN

> https://aws.amazon.com/premiumsupport/knowledge-center/amazon-eks-cluster-access/
>
>  https://www.freecodecamp.org/news/adding-limited-access-iam-user-to-eks-cluster/
> 
>  https://www.eksworkshop.com/beginner/091_iam-groups/configure-aws-auth/
  

**5. Upgrade Cluster**

*1. Check the updates available*

    aws eks list-clusters    
    aws eks describe-cluster --name eksworkshop-eksctl-upg    
    aws eks list-updates --name eksworkshop-eksctl-upg

*2. Upgrade cluster*

    eksctl upgrade cluster --name=eksworkshop-eksctl-upg --approve

  
*3. Upgrade Node Group by creating new nodegroup - Managed/Launch Template*

    eksctl get nodegroup --eksworkshop-eksctl-upg
    eksctl upgrade nodegroup --name= t3-managed-ng --cluster=eksworkshop-eksctl-upg --kubernetes-version=1.16

  
> eksctl create nodegroup --cluster=eksworkshop-eksctl-upg
> --name=<newNodeGroupName>
> 
> eksctl upgrade nodegroup --name=managed-ng-1 --cluster=managed-cluster
> --launch-template-version=3

  
*4. Upgrade the Add-Ons*

    eksctl utils update-kube-proxy --cluster=eksworkshop-eksctl-upg --approve
    eksctl utils update-aws-node --cluster=eksworkshop-eksctl-upg --approve
    eksctl utils update-coredns --cluster=eksworkshop-eksctl-upg --approve
    
*5.  Convert Files if required*

    kubectl convert -f ./<my-deployment.yaml> --output-version apps/v1

  
**6. Copy the Role Name for later use**

    STACK_NAME=$(eksctl get nodegroup --cluster eksworkshop-eksctl -o json | jq -r '.[].StackName')
    
    ROLE_NAME=$(aws cloudformation describe-stack-resources --stack-name $STACK_NAME | jq -r '.StackResources[] | select(.ResourceType=="AWS::IAM::Role") | .PhysicalResourceId')
    
    echo "export ROLE_NAME=${ROLE_NAME}" | tee -a ~/.bash_profile

