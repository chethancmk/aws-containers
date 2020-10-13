# Creating Node Groups
## https://github.com/weaveworks/eksctl/tree/master/examples

1 Create Unmanaged Node Group
    1. eksctl create nodegroup -f ./nodegroups/ng_unmanaged.yaml

2 Create Managed Node Group
    1. eksctl create nodegroup -f ./nodegroups/ng_managed.yaml

3 Create Spot Node Group
    1. eksctl create nodegroup -f nodegroups/ng_spot.yaml
    2. Spot termination handler
        helm repo add eks https://aws.github.io/eks-charts
        helm search repo eks
        helm install aws-node-termination-handler \
                    --namespace kube-system \
                    eks/aws-node-termination-handler

4. Create windows node group
    1. eksctl create nodegroup -f nodegroups/ng_windows.yaml

5. Create bottlerocket node group
    1. eksctl create nodegroup -f nodegroups/ng_bottlerocket.yaml

6. Create fargate Profile
    1. eksctl create fargateprofile -f nodegroups/ng_fargate.yaml
    2. Get the Fargate profile
    eksctl get fargateprofile --cluster eksworkshop-eksctl-upg --name fargate -o yaml


7. Check the nodes created by label
# kubernetes.io/os
    kubectl get nodes -L type
    kubectl get nodes  -l type=unmanaged
    kubectl get nodes  -l type=managed
    kubectl get nodes  -l type=spot
    kubectl get nodes  -l type=windows
    kubectl get nodes  -l type=fargate
    kubectl get nodes  -l type=bottlerocket

8. Schedule Pods on different node groups

    1. Windows IIS https://www.eksworkshop.com/beginner/300_windows/sample_app_deploy.files/windows_server_iis.yaml
        eksctl utils install-vpc-controllers --cluster eksworkshop-eksctl --approve
        kubectl create namespace windows
        kubectl apply -f windows_server_iis.yaml

    2. Fargate Pod Launch and test
        kubectl create ns fargate
        kubectl create deployment nginx --image nginx -n fargate
        kubectl get pods -n fargate
        kubectl get pods -n fargate -o wide
        kubectl get nodes
        kubectl run curl --image=radial/busyboxplus:curl -i --tty
        curl http://10.10.159.62

    3. Nginx on Linux
        kubectl apply -f linux_nginx_server.yaml

9. Cleanup
    kubectl delete -f  windows_server_iis.yaml
    kubectl delete -f linux_nginx_server.yaml

    kubectl delete deployment nginx -n fargate
    kubectl delete deployment curl

    eksctl delete nodegroup -f nodegroups/ng_windows.yaml --approve
    eksctl delete nodegroup -f nodegroups/ng_bottlerocket.yaml --approve

10. Copy the Stack Name for later use
    STACK_NAME=$(eksctl get nodegroup --cluster eksworkshop-eksctl -o json | jq -r '.[].StackName')
    ROLE_NAME=$(aws cloudformation describe-stack-resources --stack-name $STACK_NAME | jq -r '.StackResources[] | select(.ResourceType=="AWS::IAM::Role") | .PhysicalResourceId')
    echo "export ROLE_NAME=${ROLE_NAME}" | tee -a ~/.bash_profile
