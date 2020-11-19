
## Cloudwatch Insights  

#### Install Cloudwatch Insights
1. Install cloudwatch insights from the quick start provided   

> https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Container-Insights-setup-EKS-quickstart.html

2. Verify the Daemonsets and Pods running  

`kubectl get daemonset --all-namespaces`
`kubectl get pods -n amazon-cloudwatch`
  
### Monitor on Cloudwatch console for Container Insights.
1. Resource List
2. Service Map
3. Performance Metrics 
  

### Create Deployment for the php-application load generation
 
1. Apply PHP Apache Application deployment to simulate load

`k apply -f https://k8s.io/examples/application/php-apache.yaml`

2. Create HPA  

`k autoscale deployment php-apache --cpu-percent=50 --min=1 --max=1`
`k get hpa`

3. Simulate Load  

`k run -i --tty load-generator1 --image=busybox /bin/sh`
`while true; do wget -q -O - http://php-apache; done`
  
### Check Metrics and Logs from Cloudwatch Container Insights

### Create and test Metric based Alarm

### Cleanup
`k apply -f https://k8s.io/examples/application/php-apache.yaml`

### Additional References
#####  https://louay-workshops.com.au/eks-immersion-day/eks/08_cloudwatch_container_insights.html
