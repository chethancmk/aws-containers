
### EKS Persistent Volumes - EBS

1 . Ensure Node Policy to action EBS Volumes is present

    curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-ebs-csi-driver/v0.4.0/docs/example-iam-policy.json
    aws iam create-policy --policy-name Amazon_EBS_CSI_Driver --policy-document file://example-iam-policy.json

2 . Attach Policy to Node Group Role

3 . Deploy the EBS Driver  

    kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=master"
    kubectl get pods -n kube-system

4 . Create Deployment with Dynamic EBS Volume

    k apply -f dynamic_pod.yaml

5 . Create Deployment with Static EBS Volume. Volume is predefined.

    k apply -f static_pod.yaml    

    
### EKS Persistent Volumes - EFS

1 . Deploy EFS Driver

    kubectl apply -k "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/?ref=master"

2 . Create Security Group for Node to EFS Access

    aws eks describe-cluster --name cluster_name --query "cluster.resourcesVpcConfig.vpcId" --output text    
    aws ec2 describe-vpcs --vpc-ids vpc-id --query "Vpcs[].CidrBlock" --output text

3 . Create new Security Group and Rule

    aws ec2 create-security-group --description efs-test-sg --group-name efs-sg --vpc-id VPC_ID    
    aws ec2 authorize-security-group-ingress --group-id sg-xxx --protocol tcp --port 2049 --cidr VPC_CIDR

4 . Create EFS File System

    aws efs create-file-system --creation-token eks-efs    
    aws efs create-mount-target --file-system-id FileSystemId --subnet-id SubnetID --security-group GroupID

5 . Configure and Run Pods with EFS access

    k apply -f efs_pod.yaml
