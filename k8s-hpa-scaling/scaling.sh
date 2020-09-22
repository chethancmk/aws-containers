# Install Metric Server
DOWNLOAD_URL=$(curl -Ls "https://api.github.com/repos/kubernetes-sigs/metrics-server/releases/latest" | jq -r .tarball_url)
DOWNLOAD_VERSION=$(grep -o '[^/v]*$' <<< $DOWNLOAD_URL)
curl -Ls $DOWNLOAD_URL -o metrics-server-$DOWNLOAD_VERSION.tar.gz
mkdir metrics-server-$DOWNLOAD_VERSION
tar -xzf metrics-server-$DOWNLOAD_VERSION.tar.gz --directory metrics-server-$DOWNLOAD_VERSION --strip-components 1


# Apply metric-server CRD
kubectl apply -f metrics-server-$DOWNLOAD_VERSION/deploy/1.8+/
kubectl get deployment metrics-server -n kube-system
kubectl get apiservice v1beta1.metrics.k8s.io -o yaml

# PHP Apache Application
kubectl apply -f https://k8s.io/examples/application/php-apache.yaml

# Create HPA
kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10
kubectl get hpa

# Simulate Load
kubectl run -i --tty load-generator --image=busybox /bin/sh
while true; do wget -q -O - http://php-apache; done
kubectl get hpa -w


# Cleanup
kubectl delete hpa,svc php-apache
kubectl delete deployment php-apache load-generator
kubectl delete -f metrics-server-$DOWNLOAD_VERSION/deploy/1.8+/