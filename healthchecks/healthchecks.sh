# Liveness Probe
kubectl apply -f ~/environment/healthchecks/liveness-app.yaml
kubectl get pod liveness-app
kubectl describe pod liveness-app
# Simulate Failure
kubectl exec -it liveness-app -- /bin/kill -s SIGUSR1 1
kubectl get pod liveness-app
kubectl logs liveness-app --previous


# Readiness Probe
kubectl apply -f ~/environment/healthchecks/readiness-deployment.yaml
kubectl get pods -l app=readiness-deployment
kubectl describe deployment readiness-deployment | grep Replicas:
# Simulate Failure
kubectl exec -it readiness-deployment-589b548d5-87s47 -- rm /tmp/healthy
kubectl get pods -l app=readiness-deployment
kubectl describe deployment readiness-deployment | grep Replicas:
kubectl exec -it readiness-deployment-589b548d5-87s47 -- touch /tmp/healthy
kubectl get pods -l app=readiness-deployment


kubectl delete -f ~/environment/healthchecks/liveness-app.yaml
kubectl delete -f ~/environment/healthchecks/readiness-deployment.yaml




