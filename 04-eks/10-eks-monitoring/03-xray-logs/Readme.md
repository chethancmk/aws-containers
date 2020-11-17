## X-ray for Tracing

### Deploy Xray Daemonset

1. Attach the following policies to the Node Role.

- CloudWatchAgentServerPolicy

- AWSXRayDaemonWriteAccess

2. Or Create service account with Xray Access
`eksctl create iamserviceaccount --name xray-daemon --namespace default --cluster uipl18 --attach-policy-arn arn:aws:iam::aws:policy/AWSXRayDaemonWriteAccess --approve --override-existing-serviceaccounts`

`kubectl label serviceaccount xray-daemon app=xray-daemon`

4. Create the XRAY Daemonset
`kubectl create -f https://eksworkshop.com/intermediate/245_x-ray/daemonset.files/xray-k8s-daemonset.yaml`

  5. Check the logs
    
`kubectl logs -l app=xray-daemon`

### Deploy Microservice for Testing
1. Deploy Microservice for testing  

`kubectl apply -f https://eksworkshop.com/intermediate/245_x-ray/sample-front.files/x-ray-sample-front-k8s.yml`

`kubectl apply -f https://eksworkshop.com/intermediate/245_x-ray/sample-back.files/x-ray-sample-back-k8s.yml`
  
2. Check the services

`kubectl describe deployments x-ray-sample-front-k8s x-ray-sample-back-k8s`

`kubectl describe services x-ray-sample-front-k8s x-ray-sample-back-k8s`

3. Get endpoint of the service and open in browser. 

`kubectl get service x-ray-sample-front-k8s -o wide`

4. Check the xray console for the traces  

5. Cleanup

`kubectl delete deployments x-ray-sample-front-k8s x-ray-sample-back-k8s`

`kubectl delete services x-ray-sample-front-k8s x-ray-sample-back-k8s`
  
`kubectl delete -f https://eksworkshop.com/intermediate/245_x-ray/daemonset.files/xray-k8s-daemonset.yaml`
  
`eksctl delete iamserviceaccount --name xray-daemon --cluster uipl18`

