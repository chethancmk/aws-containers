## Metric Server for Monitoring
kubectl create namespace metrics
helm install metrics-server  stable/metrics-server --version 2.9.0 --namespace metrics
kubectl top node
kubectl top pod  --all-namespaces 

# Hard and Soft Limits
## Use stress-ng to create stressed containers
1. Soft Limit
    k apply -f 1-soft-limit.yaml
2. Hard Limit - CPU Breach
    k apply -f 2-hard-limit-cpu.yaml
3. Hard Limit - Memory Breach
    k apply -f 3-hard-limit-mem.yaml

## Cleanup
kubectl delete -f 1-soft-limit.yaml
kubectl delete -f 2-hard-limit-cpu.yaml
kubectl delete -f 3-hard-limit-mem.yaml

