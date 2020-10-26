# Creating Node Groups
  
> https://github.com/weaveworks/eksctl/tree/master/examples
 

**1. Create Unmanaged Node Group**

    eksctl create nodegroup -f ./nodegroups/ng_unmanaged.yaml

**2. Create Managed Node Group**
 

    eksctl create nodegroup -f ./nodegroups/ng_managed.yaml

  

**3 Create Spot Node Group**

    eksctl create nodegroup -f nodegroups/ng_spot.yaml

 1. Spot termination handler

	    helm repo add eks https://aws.github.io/eks-charts
	    helm search repo eks
	    helm install aws-node-termination-handler \
	    --namespace kube-system \
	    eks/aws-node-termination-handler

 **4. Create windows node group**

	     eksctl create nodegroup -f nodegroups/ng_windows.yaml
 **5. Create bottlerocket node group**

	     eksctl create nodegroup -f nodegroups/ng_bottlerocket.yaml

 **6. Create fargate Profile**
  
		eksctl create fargateprofile -f nodegroups/ng_fargate.yaml
 
-  Get the Fargate profile

		    eksctl get fargateprofile --cluster eksworkshop-eksctl-upg --name fargate -o yaml

**7. Check the nodes created by label**

> Check label kubernetes.io/os for os

    kubectl get nodes -L type
    kubectl get nodes -l type=unmanaged
    kubectl get nodes -l type=managed
    kubectl get nodes -l type=spot
    kubectl get nodes -l type=windows
    kubectl get nodes -l type=fargate
    kubectl get nodes -l type=bottlerocket

# Schedule Pods on different node groups

> Scheduling on Windows Nodes :  Windows IIS
> https://www.eksworkshop.com/beginner/300_windows/sample_app_deploy.files/windows_server_iis.yaml

 **1. Deploy IIS on Windows nodes**

       eksctl utils install-vpc-controllers --cluster eksworkshop-eksctl --approve
	   kubectl create namespace windows
	   kubectl apply -f windows_server_iis.yaml

**2. Fargate Pod Launch and test**

    kubectl create ns fargate
    kubectl create deployment nginx --image nginx -n fargate
    kubectl get pods -n fargate
    kubectl get pods -n fargate -o wide
    kubectl get nodes
    kubectl run curl --image=radial/busyboxplus:curl -i --tty
    curl http://10.10.159.62 

**3. Nginx on Linux**

      kubectl apply -f linux_nginx_server.yaml
      
**4. Cleanup** 

	    kubectl delete -f windows_server_iis.yaml
	    kubectl delete -f linux_nginx_server.yaml
	    kubectl delete deployment nginx -n fargate
	    kubectl delete deployment curl

		eksctl delete nodegroup -f nodegroups/ng_windows.yaml --approve
		eksctl delete nodegroup -f nodegroups/ng_bottlerocket.yaml --approve

# Upgrade EKS Nodes 

**1. Upgrade managed node through eksctl**

	    eksctl upgrade nodegroup --name= t3-managed-ng --cluster=eksworkshop-eksctl-upg --kubernetes-version=1.16
 
**2. Create new Node group and delete old node group**

	    eksctl create nodegroup --cluster=<clustername>  --name=<newNodeGroupName>
	    eksctl delete nodegroup --cluster=<clustername> --name=<oldNodeGroupName>

**3. Upgrade the launch template version**

	    eksctl upgrade nodegroup --name=managed-ng-1 --cluster=managed-cluster --launch-template-version=3

  
