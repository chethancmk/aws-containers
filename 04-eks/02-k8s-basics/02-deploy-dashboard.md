## Default Kubernetes Dashboard
export DASHBOARD_VERSION="v2.0.0"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/${DASHBOARD_VERSION}/aio/deploy/recommended.yaml
kubectl proxy --port=8080 --address=0.0.0.0 --disable-filter=true &

### kubectl edit svc kubernetes-dashboard -n kubernetes-dashboard
kubectl get service/nginx kubernetes-dashboard -n kubernetes-dashboard --export=true -o yaml > k8s_dashboard.yml
### Change type to LoadBlancer
kubectl get svc kubernetes-dashboard -n kubernetes-dashboard
### Get the URL and login with token
aws eks get-token --cluster-name eksworkshop-eksctl | jq -r '.status.token'
### Deploy a Deployment through the portal and delete the deployment.

## Alternate Dashboards for Kubernetes
kubectl apply --kustomize github.com/kubenav/deploy/kustomize