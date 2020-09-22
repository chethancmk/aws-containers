# Check Helm Installed
helm list

kubectl create namespace prometheus

helm install prometheus stable/prometheus \
    --namespace prometheus \
    --set alertmanager.persistentVolume.storageClass="gp2" \
    --set server.persistentVolume.storageClass="gp2"

# The Prometheus PushGateway can be accessed via port 9091 on the following DNS name from within your cluster:
# prometheus-pushgateway.prometheus.svc.cluster.local
# https://louay-workshops.com.au/eks-immersion-day/bonus/020_monitoring.html
  export POD_NAME=$(kubectl get pods --namespace prometheus -l "app=prometheus,component=pushgateway" -o jsonpath="{.items[0].metadata.name}")
  kubectl --namespace prometheus port-forward $POD_NAME 9091
  
  kubectl --namespace prometheus
  prometheus-server
  
  ssh -i windows_vm.pem ec2-user@15.207.171.34 -L 8080:localhost:8080
  kubectl port-forward -n prometheus deploy/prometheus-server 8080:9090
  http://localhost:8080

#   Deploy Grafana
kubectl create namespace grafana
# Deploy Grafana Chart
helm install grafana stable/grafana \
    --namespace grafana \
    --set persistence.storageClassName="gp2" \
    --set adminPassword='EKS!sAWSome' \
    --set datasources."datasources\.yaml".apiVersion=1 \
    --set datasources."datasources\.yaml".datasources[0].name=Prometheus \
    --set datasources."datasources\.yaml".datasources[0].type=prometheus \
    --set datasources."datasources\.yaml".datasources[0].url=http://prometheus-server.prometheus.svc.cluster.local \
    --set datasources."datasources\.yaml".datasources[0].access=proxy \
    --set datasources."datasources\.yaml".datasources[0].isDefault=true \
    --set service.type=LoadBalancer

# Get Loadbalancer DNS
export ELB=$(kubectl get svc -n grafana grafana -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
echo "http://$ELB"
# Get Password
kubectl get secret --namespace grafana grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

# Create Cluster Monitoring Dashboard with id 3119 and import for promethus
# Create POD Monitoring Dashboard with id 6417  and import for promethus


helm uninstall prometheus --namespace prometheus
helm uninstall grafana --namespace grafana
