# https://louay-workshops.com.au/eks-immersion-day/eks/08_cloudwatch_container_insights.html
# install wordpress
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install understood-zebu bitnami/wordpress
echo Password: $(kubectl get secret --namespace default understood-zebu-wordpress -o jsonpath="{.data.wordpress-password}" | base64 --decode)
credentials : user : ycWrY4LRpG

# Loadbalancer URL
 export SERVICE_IP=$(kubectl get svc --namespace default understood-zebu-wordpress --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
    echo "WordPress URL: http://$SERVICE_IP/"
    echo "WordPress Admin URL: http://$SERVICE_IP/admin"

# Install Cloudwatch Insights
curl https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/quickstart/cwagent-fluentd-quickstart.yaml | sed "s/{{cluster_name}}/eksworkshop-eksctl/;s/{{region_name}}/ap-south-1/" | kubectl apply -f -
kubectl get daemonset --all-namespaces
kubectl get pods -n amazon-cloudwatch
# Monitor on cloudwatch console.

# Load Test with siege
curl -C - -O http://download.joedog.org/siege/siege-latest.tar.gz
tar -xvf siege-latest.tar.gz
cd siege-4.0.7
./configure
make all
sudo make install 
siege --version
siege -c 200 -i http://$(kubectl get service understood-zebu-wordpress -o json | jq -r '.status.loadBalancer.ingress[].hostname')
# Check Metrics and Logs

# Metric based Alarm

# cleanup
helm uninstall understood-zebu



