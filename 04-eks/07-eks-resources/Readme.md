## Resource Management

#### Metric Server for Monitoring
1. Install Metric server to monitor pod resource usage

		kubectl create namespace metrics
		helm install metrics-server stable/metrics-server --version 2.9.0 --namespace metrics
		kubectl top node
		kubectl top pod --all-namespaces

 ### Resource Requests and Limits

1. Create pods with soft limit and hard limits with breach on cpu and memory

	    k apply -f limits/1-soft-limit.yaml
	    k apply -f limits/2-hard-limit-cpu.yaml
	    k apply -f limits/3-hard-limit-mem.yaml
	    
2. Monitor the Resource usage and failures using metric server
	
	    k top pods  

3. Cleanup

	    kubectl delete -f limits/1-soft-limit.yaml
	    kubectl delete -f limits/2-hard-limit-cpu.yaml
	    kubectl delete -f limits/3-hard-limit-mem.yaml

### Limit Range
1. Create Namespace limit-range

	    k create namespace limit-range
2. Create Limit range for the namespace

	   k apply -f limit-range/limit-range.yaml

3. Create a Pod breaching the limit threshold to see error

	   k apply -f limit-range/1-pod-with-limit.yaml
  
4. Create a Pod without limit to see the pod inherit the upper limit

	    k apply -f limit-range/2-pod-without-limit.yaml
5. Clean up

	    k delete namespace limit-range

### Resource Quota

1. Create Dev Namespace

	    kubectl create namespace dev

2. Create Quota for dev namespace

	    kubectl create quota dev --hard=limits.cpu=1,limits.memory=1G --namespace dev

3. Create deployment without limit to see error

	    k apply -f quota/deployment.yaml

4. Edit deployment with adding limit and see the quota used.
		
		k apply -f quota/deployment.yaml
		k get pods -A
		k describe quota dev -n dev

5. Scale deployment beyond quota
		
		k scale deployment dev -n dev --replicas=5
		k describe quota dev -n dev

6. Clean up

		k delete ns dev
### Priority Class

1. Create 2 priority classes high and low

		kubectl create -f priority-class/priority-class.yaml

 2. Create deployment for low priority containers

		k apply -f priority-class/low-pri-deployment.yaml
		k get pods
2. Create deployment for high priority containers and monitor the priority precedence

		k apply -f priority-class/high-pri-deployment.yaml
		k get pods

  4. Delete the high priority and check the low priority pick up

		  k delete -f priority-class/high-pri-deployment.yaml

3. Clean up

		k delete -f priority-class/high-pri-deployment.yaml
		k delete -f priority-class/low-pri-deployment.yaml
		k delete -f priority-class/priority-class.yaml

