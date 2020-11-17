
# EKS ALB Ingress

### Prerequisite parameters

1. Get the VPC ID and the latest Ingress Version

	    export ALB_INGRESS_VERSION=v2.0.0
	    export VPC_ID=$(aws eks describe-cluster --name uipl18 --query "cluster.resourcesVpcConfig.vpcId" --output text)

### Security Config to Allow Ingress Creation

1. Register EKS OIDC with IAM

	    eksctl utils associate-iam-oidc-provider --cluster=uipl18 --approve

2. Download the template rbac Role and IAM Policy

	    wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/rbac-role.yaml
	    wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/${ALB_INGRESS_VERSION}/docs/examples/iam-policy.json
  
3. Create an IAM policy with ALB permissions

aws iam create-policy \
	--policy-name ALBIngressControllerIAMPolicy \
	--policy-document file://iam-policy.json

  4. Get the IAM Policy ARN

		  export PolicyARN=$(aws iam list-policies --query 'Policies[?PolicyName==`ALBIngressControllerIAMPolicy`].Arn' --output text)
 
5. Create the  RBAC role/role binding/service account

	    kubectl apply -f rbac-role.yaml

  6. Update service account "alb-ingress-controller" with IAM Policy annotation

eksctl create iamserviceaccount \
  --cluster=uipl18 \
  --namespace=kube-system \
  --name=alb-ingress-controller \
  --attach-policy-arn=$PolicyARN \
  --override-existing-serviceaccounts \
  --approve
  
### Apply the Ingress Controller for ec2

https://kubernetes-sigs.github.io/aws-load-balancer-controller/v2.0/guide/controller/installation/

0. Apply the cert manager
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v1.0.2/cert-manager.yaml
  
1. Get the template for Ingress Controller

	    wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/main/docs/install/v2_0_0_full.yaml
  
2. Update (cluster name,vpc id,region,namespace ) in alb-ingress-controller.yaml and Apply the ingress controller.
	
		<!-- kubectl apply -f alb-ingress-controller.yaml
		kubectl get deployment alb-ingress-controller -n kube-system -->

		k apply -f v2_0_0_full.yaml

  3. Check the logs of ingress controller pod for any issues

		 kubectl logs -n kube-system $(kubectl get po -n kube-system | egrep -o "alb-ingress[a-zA-Z0-9-]+")

  
  4. Create Deployment/Svc to use in Ingress

		  k create deployment nginx --image=nginx
		  k scale deployment nginx --replicas=3
		  k expose deployment nginx --port=80 --type=NodePort

  5. Edit the Ingress (ingress.yaml) file for path rules and apply

		 k apply -f ingress.yaml

3. Checl the logs of the ingress controller

		k logs -n kube-system $(kubectl get po -n kube-system | egrep -o "aws-load-balancer-controller-[a-zA-Z0-9-]+") -f
		
4. Check the ALB created and once provisioning is complete, verify the url works

	    k get ingress -A

6. Clean up

	    kubectl delete -f ingress.yaml
	    kubectl delete svc/nginx
	    kubectl delete deployment/nginx

### Apply the Ingress Controller for fargate
 
1. Create Fargate Profile with namespace selector "fargate" and verify
	
	    eksctl create fargateprofile --cluster uipl17 --name fargate --namespace fargate
	    eksctl get fargateprofile --cluster uipl17 -o yaml

  

2. Launch a namespace, deployment and service in fargate namespace

		kubectl create ns fargate
		kubectl create deployment nginx --image nginx -n fargate
		kubectl expose deployment nginx --port 80 --type=NodePort -n fargate

3. The security config mentioned for EC2 above should be completed.

4. The ingress controller setup from above for EC2 should be completed
	
5. Edit the ingress file and uncomment the annotation for target type to be ip for fargate

		annotations:
			alb.ingress.kubernetes.io/target-type: ip

6. Apply the ingress and check logs 

	    k apply -f ingress.yaml
	    k logs -n kube-system $(kubectl get po -n kube-system | egrep -o "alb-ingress[a-zA-Z0-9-]+") -f

7. Check the ALB created and once provisioning is complete, verify the url works

		k get ingress -A

8. Clean up
		
		kubectl delete -f ingress.yaml
		kubectl delete svc/nginx
		kubectl delete deployment/nginx  

### Clean up controller and role
  
1. Clean up ingress controller

		k delete -f alb-ingress-controller.yaml

2. Clean up rbac role and service account

		k delete -f rbac-role.yaml
		
3. Delete the IAM policy
		
		eksctl delete iamserviceaccount \
		--cluster=eksworkshop-eksctl-upg \
		--namespace=kube-system \
		--name=alb-ingress-controller
