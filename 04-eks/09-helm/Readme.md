## Package manager for k8s
    1. Reusable templates
    2. versioning
    3. Inplace upgrades

## https://docs.aws.amazon.com/eks/latest/userguide/helm.html

## helm.sh and helm hub for marketplace charts
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

## Common helm repos
stable          https://kubernetes-charts.storage.googleapis.com/        
bitnami         https://charts.bitnami.com/bitnami                       
incubator       http://storage.googleapis.com/kubernetes-charts-incubator
eks             https://aws.github.io/eks-charts    

## Commands
helm version
helm repo list
helm repo add eks https://aws.github.io/eks-charts
helm search repo eks fluent
helm install aws-for-fluent-bit -n kube-system eks/aws-for-fluent-bit
helm show chart eks/aws-for-fluent-bit

k get pods -A
k get daemonset -A

helm ls -n kube-system
helm upgrade aws-for-fluent-bit -n kube-system eks/aws-for-fluent-bit
helm ls -n kube-system
helm rollback aws-for-fluent-bit 1 -n kube-system eks/aws-for-fluent-bit

helm uninstall aws-for-fluent-bit -n kube-system 

## Creating Own Chart
helm create myapp
helm install --debug myapp --dry-run .
{{ .Release.Name }}
