# Priority Class

1. Create 2 priority classes high and low
    kubectl create -f priority-class.yaml

2. Create deployment for low priority containers
    k apply -f low-pri-deployment.yaml
    k get pods

3. Create deployment for high priority containers
    k apply -f high-pri-deployment.yaml
    k get pods

4. Delete the high priority and check the low priority pick up
    k delete -f high-pri-deployment.yaml
    
5. Clean up 
    k delete -f high-pri-deployment.yaml
    k delete -f low-pri-deployment.yaml
    k delete -f priority-class.yaml