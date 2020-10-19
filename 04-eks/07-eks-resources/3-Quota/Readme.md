# Quota
1. Create Dev Namespace
    kubectl create namespace dev

2. Create Quota for dev namespace
    kubectl create quota dev --hard=limits.cpu=1,limits.memory=1G --namespace dev    

3. Create deployment without limit to see error

4. Create deployment with limit and see the quota used.
    k apply -f deployment.yaml   
    k get pods -A
    k describe quota dev -n dev

    k scale deployment dev -n dev --replicas=5
    k describe quota dev -n dev

5. Clean up 
    k delete -f deployment.yaml
    k delete ns dev