## Default Kubernetes Dashboard

 **1. Create the Dashboard deployment and service**

	    export DASHBOARD_VERSION="v2.0.4"
	    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/${DASHBOARD_VERSION}/aio/deploy/recommended.yaml
	    
**2. Expose the service through LoadBalancer (edit service type to LoadBalancer)**

	    kubectl proxy --port=8080 --address=0.0.0.0 --disable-filter=true &	    
	    kubectl edit svc kubernetes-dashboard -n kubernetes-dashboard	    
	    kubectl get service kubernetes-dashboard -n kubernetes-dashboard -o yaml > k8s_dashboard.yml	    
	    kubectl apply -f k8s_dashboard.yml

 **3. Login to the loadbalancer endpoint with the token.**

 -  Get the URL and login with token

	    aws eks get-token --cluster-name eksworkshop-eksctl-upg | jq -r '.status.token'

**4. Deploy a Deployment and service through the portal.**
 

**5. Clean up - Delete the dashboard**

kubectl delete -f https://raw.githubusercontent.com/kubernetes/dashboard/${DASHBOARD_VERSION}/aio/deploy/recommended.yaml

  
## Alternate Dashboards - Kubenav

**1. Apply Kubenav**
kubectl apply --kustomize github.com/kubenav/deploy/kustomize
k get svc kubenav -n kubenav -o yaml > kubenav_svc.yaml
k describe svc kubenav -n kubenav
k get endpoints -A

**2. Check the dashboard on port 14122 on the loadbalancer**

**3. Delete the kubenav dashboard**

    kubectl delete --kustomize github.com/kubenav/deploy/kustomize

