
## Pre-requiste - Create a nginx Deployment

    k run nginx --image nginx --replicas 3
    k get pods -o wide

## Service on Cluster IP

	    k expose deployment nginx --port=80 --target-port=80
	    k get svc -o wide
	    k run busybox --image radial/busyboxplus:curl --restart=Never --rm -it -- /bin/sh
	    curl http://nginx
	    printenv
	    nslookup nginx
	 

## Service on NodePort

	    k get service nginx -o wide
	    k delete svc nginx
	    k expose deployment nginx --port=80 --target-port=80 --type=NodePort
	    k get svc -o wide (NodePort : 32k+)
	    k get nodes -o wide
	    curl http://{nodeIP}:{nodePort}
        
## Service on Classic Load Balancer

    k get service nginx -o wide
    k delete svc nginx
    k expose deployment nginx --port=80 --target-port=80 --type=LoadBalancer
    k get svc -o wide

## Service on Network Load Balancer

    kubectl edit svc nginx
    annotations :
    	service.beta.kubernetes.io/aws-load-balancer-type: nlb
    k get svc nginx -o wide
## Cleanup

    k delete deployment/nginx svc/nginx
