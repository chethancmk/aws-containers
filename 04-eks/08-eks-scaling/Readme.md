## Horizontal Pod Auto Scaler

1. Install metric server

	    kubectl create namespace metrics
	    helm install metrics-server stable/metrics-server --version 2.9.0 --namespace metrics
	    kubectl top node
	    kubectl top pod --all-namespaces

  2. Apply PHP Apache Application deployment to simulate load

		  k apply -f https://k8s.io/examples/application/php-apache.yaml
		  
2. Create HPA
	

		k autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10
		k get hpa

3. Simulate Load

	     k run -i --tty load-generator --image=busybox /bin/sh
	     while  true; do wget -q -O - http://php-apache; done
4. Monitor the hpa in action	

		k get hpa -w
5 Cleanup hpa

	    k delete hpa,svc php-apache
	    k delete deployment php-apache load-generator
	    helm uninstall metrics-server

## Cluster Autoscaler

###  1. Security setup to trigger scaling of nodes

0. Check the ASG
aws autoscaling \
    describe-auto-scaling-groups \
    --query "AutoScalingGroups[? Tags[? (Key=='eks:cluster-name') && Value=='uipl17']].[AutoScalingGroupName, MinSize, MaxSize,DesiredCapacity]" \
    --output table


1. Register eks OIDC with iam

		eksctl utils associate-iam-oidc-provider --cluster uipl17 --approve
		 

  2. Create policy for Autoscaling
			
		  aws iam create-policy --policy-name k8s-asg-policy --policy-document k8s-asg-policy.json

3. Create Service Account with policy reference

eksctl create iamserviceaccount \
 --name cluster-autoscaler \
 --namespace kube-system \
 --cluster uipl17\
 --attach-policy-arn "arn:aws:iam::${ACCOUNT_ID}:policy/k8s-asg-policy" \
 --approve \
 --override-existing-serviceaccounts

4. Check the service account created

	    kubectl -n kube-system describe sa cluster-autoscaler

### 2. Install and test Autoscaler

1. Get the Autoscaler deployment change safe to evict to false 

	    wget https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml

		kubectl apply -f cluster-autoscaler-autodiscover.yaml
		kubectl logs -f deployment/cluster-autoscaler -n kube-system

  2. Simualte Load with NGINX
			
		  kubectl apply -f nginx.yaml
		  kubectl get deployment/nginx-to-scaleout
		  kubectl scale --replicas=20 deployment/nginx-to-scaleout
		  kubectl get pods -o wide --watch
		  kubectl logs -f deployment/cluster-autoscaler -n kube-system
3. Cleanup

		kubectl delete -f cluster-autoscaler-autodiscover.yaml
		kubectl delete -f nginx.yaml
		
		eksctl delete iamserviceaccount \
		--name cluster-autoscaler \
		--namespace kube-system \
		--cluster ${CLUSTERNAME}
