
eksctl utils associate-iam-oidc-provider --cluster uipl18 --region=ap-south-1 --approve
Delete IAM Policy AWSLoadBalancerControllerIAMPolicy

Get the new IAM policy
curl -o iam-policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json

aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document file://iam-policy.json

ARN : arn:aws:iam::895300689201:policy/AWSLoadBalancerControllerIAMPolicy

Create IAM Service account with the ALB policy

eksctl create iamserviceaccount \
  --cluster=uipl18 \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --attach-policy-arn=arn:aws:iam::895300689201:policy/AWSLoadBalancerControllerIAMPolicy \
  --override-existing-serviceaccounts \
  --approve

Install the TargetGroupBinding CRD's 
kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"

Add Helm Repo for EKS charts
helm repo add eks https://aws.github.io/eks-charts

Install the Ingress Controller 

helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
  --set clusterName=uipl18 \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller \
  -n kube-system

Verify the deployment
kubectl get deployment -n kube-system aws-load-balancer-controller
  
4. Create Example Deployment/Svc to use in Ingress

		  k create deployment nginx --image=nginx
		  k scale deployment nginx --replicas=3
		  k expose deployment nginx --port=80 --type=NodePort -n

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
