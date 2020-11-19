Node Policy to action EBS Volumes

curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-ebs-csi-driver/v0.4.0/docs/example-iam-policy.json
aws iam create-policy --policy-name Amazon_EBS_CSI_Driver --policy-document file://example-iam-policy.json
Attach Policy to Node Group Role

Deploy the EBS Driver

kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=master"
kubectl get pods -n kube-system

Create Dynamic EBS Volume
k apply -f dynamic_pod.yaml



Deploy EFS Driver

kubectl apply -k "github.com/kubernetes-sigs/aws-efs-csi-driver/deploy/kubernetes/overlays/stable/?ref=master"

Create Security Group for Node to EFS Access
aws eks describe-cluster --name cluster_name --query "cluster.resourcesVpcConfig.vpcId" --output text
aws ec2 describe-vpcs --vpc-ids vpc-id --query "Vpcs[].CidrBlock" --output text

Create new Security Group and Rule
aws ec2 create-security-group --description efs-test-sg --group-name efs-sg --vpc-id VPC_ID
aws ec2 authorize-security-group-ingress --group-id sg-xxx  --protocol tcp --port 2049 --cidr VPC_CIDR

Create EFS File System
aws efs create-file-system --creation-token eks-efs
aws efs create-mount-target --file-system-id FileSystemId --subnet-id SubnetID --security-group GroupID

Configure and Run Pods with EFS access
k apply -f efs_pod.yaml
















