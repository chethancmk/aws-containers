## CIS Benchmark tool - Kube-bench  

1. Run the benchmark tool as a job

		kubectl apply -f job.yaml
2. Get the pod name
		
		kubectl get pods --all-namespaces
		
3. Check the logs

		kubectl logs kube-bench-g2zvh
4. Clean Up

		kubectl delete -f job-eks.yaml
		rm -f job-eks.yaml
