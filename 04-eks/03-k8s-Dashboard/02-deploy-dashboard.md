## Default Kubernetes Dashboard
export DASHBOARD_VERSION="v2.0.4"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/${DASHBOARD_VERSION}/aio/deploy/recommended.yaml
kubectl proxy --port=8080 --address=0.0.0.0 --disable-filter=true &

### kubectl edit svc kubernetes-dashboard -n kubernetes-dashboard
kubectl get service kubernetes-dashboard -n kubernetes-dashboard -o yaml > k8s_dashboard.yml
kubectl apply -f k8s_dashboard.yml
### Change type to LoadBlancer
kubectl get svc kubernetes-dashboard -n kubernetes-dashboard
### Get the URL and login with token
aws eks get-token --cluster-name eksworkshop-eksctl-upg | jq -r '.status.token'
### Deploy a Deployment through the portal and delete the deployment.
### deploy httpd container and service

## Delete the Dashboard
kubectl delete -f https://raw.githubusercontent.com/kubernetes/dashboard/${DASHBOARD_VERSION}/aio/deploy/recommended.yaml

## Alternate Dashboards for Kubernetes
kubectl apply --kustomize github.com/kubenav/deploy/kustomize

k get svc kubenav -n kubenav -o yaml > kubenav_svc.yaml
k describe svc kubenav -n kubenav
k get endpoints -A
### Check the dashboard on port 14122 on the loadbalancer
### Delete the dashboard
kubectl delete --kustomize github.com/kubenav/deploy/kustomize