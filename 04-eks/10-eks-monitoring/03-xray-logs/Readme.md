# X-ray for Tracing

> https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/deploy_servicelens_CloudWatch_agent_deploy_EKS.html
1. Attach the following policies to the Node Role.
  - CloudWatchAgentServerPolicy 
  - AWSXRayDaemonWriteAccess
2. Create the XRAY/CW/FluentD daemonset by replacing the cluster and region name below

    `curl https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/master/k8s-deployment-manifest-templates/deployment-mode/daemonset/cwagent-fluentd-xray/cwagent-fluentd-xray-quickstart.yaml | sed "s/{{cluster_name}}/cluster-name/;s/{{region_name}}/region/" | kubectl apply -f -`

    `kubectl describe daemonset xray-daemon -n amazon-cloudwatch`
    
    `kubectl get pod --selector name=xray-daemon -n amazon-cloudwatch`
    
    `kubectl logs -l name=xray-daemon -n amazon-cloudwatch`

  
3. Deploy Microservice for testing

    `kubectl apply -f https://eksworkshop.com/intermediate/245_x-ray/sample-front.files/x-ray-sample-front-k8s.yml`
    
    `kubectl apply -f https://eksworkshop.com/intermediate/245_x-ray/sample-back.files/x-ray-sample-back-k8s.yml`
  

4. Check the services

    `kubectl describe deployments x-ray-sample-front-k8s x-ray-sample-back-k8s`
    
    `kubectl describe services x-ray-sample-front-k8s x-ray-sample-back-k8s`

    `kubectl get service x-ray-sample-front-k8s -o wide`

5. Check the xray console

 6. Cleanup 

    `kubectl delete deployments x-ray-sample-front-k8s x-ray-sample-back-k8s`
    
    `kubectl delete services x-ray-sample-front-k8s x-ray-sample-back-k8s`

    `curl https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/master/k8s-deployment-manifest-templates/deployment-mode/daemonset/cwagent-fluentd-xray/cwagent-fluentd-xray-quickstart.yaml | sed "s/{{cluster_name}}/cluster-name/;s/{{region_name}}/region/" | kubectl delete -f -`
