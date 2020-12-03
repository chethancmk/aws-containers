## Prometheus and Grafana Logs
1. Check Helm Installed

    helm list
    kubectl create namespace prometheus

helm install prometheus prometheus-community/prometheus \
    --namespace mon \
    --set alertmanager.persistentVolume.storageClass="gp2" \
    --set server.persistentVolume.storageClass="gp2"

2. The Prometheus PushGateway can be accessed via port 9091 on the following DNS name from within your cluster:

> prometheus-pushgateway.prometheus.svc.cluster.local

3. View the prometheus-server Endpoint through tunneling

    export POD_NAME=$(kubectl get pods --namespace mon -l "app=prometheus,component=pushgateway" -o jsonpath="{.items[0].metadata.name}")

    kubectl --namespace mon port-forward $POD_NAME 9091
    kubectl --namespace mon

ssh -i windows_vm.pem ec2-user@15.207.171.34 -L 8080:localhost:8080

kubectl port-forward -n prometheus deploy/prometheus-server 8080:9090

http://localhost:8080

4. Deploy Grafana

kubectl create namespace grafana

5. Deploy Grafana Charts

helm install grafana stable/grafana \
--namespace mon \
--set persistence.storageClassName="gp2" \
--set adminPassword='EKS!sAWSome' \
--set datasources."datasources\.yaml".apiVersion=1 \
--set datasources."datasources\.yaml".datasources[0].name=Prometheus \
--set datasources."datasources\.yaml".datasources[0].type=prometheus \
--set datasources."datasources\.yaml".datasources[0].url=http://prometheus-server.mon.svc.cluster.local \
--set datasources."datasources\.yaml".datasources[0].access=proxy \
--set datasources."datasources\.yaml".datasources[0].isDefault=true \
--set service.type=NodePort
  
6. Deploy the Ingress File to expose redirect to nginx ingress

    k apply -f ingress.yaml

7. Deploy the nginx ingress to expose grafana

    k apply -f nginxIngress.yaml

7. Get Password

    kubectl get secret --namespace mon grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
 
8. Edit the Config Map to change the root path for reverse proxy in the .ini file

    k edit cm grafana -n mon

    [server]
    domain = k8s-mon-mylb-20cc66def3-1274277145.ap-south-1.elb.amazonaws.com
    root_url = http://k8s-mon-mylb-20cc66def3-1274277145.ap-south-1.elb.amazonaws.com/grafana/

    
9. Create POD Monitoring Dashboard with id 6417 and import for prometheus

### Cleanup
  
helm uninstall prometheus --namespace prometheus
helm uninstall grafana --namespace grafana
