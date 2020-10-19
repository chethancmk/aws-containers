## Liveness Probe

1. Deploy a pod with liveness probe

		kubectl apply -f liveness-pod.yaml
		kubectl get pod liveness-pod
		kubectl describe pod liveness-pod

2. Simulate Failure by killing the pid 1. Check the logs.

	    kubectl exec -it liveness-pod-- /bin/kill -s SIGUSR1 1
	    kubectl get pod liveness-pod
	    kubectl logs liveness-pod --previous

  
  

## Readiness Probe
1. Deploy a pod with readiness probe

	    kubectl apply -f readiness-pod.yaml
	    kubectl get pods -l app=readiness-deployment
	    kubectl describe deployment readiness-deployment | grep Replicas:

2. Simulate non-readiness

	    kubectl exec -it {podname} -- rm /tmp/healthy
	    kubectl get pods -l app=readiness-deployment
	    kubectl describe deployment readiness-deployment | grep Replicas:
	    kubectl exec -it {podname} -- touch /tmp/healthy
	    kubectl get pods -l app=readiness-deployment

  
  ## Cleanup

    kubectl delete -f liveness-app.yaml
    kubectl delete -f readiness-deployment.yaml

