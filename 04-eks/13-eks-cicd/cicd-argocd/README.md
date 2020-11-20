1. Install ArgoCD
Refrence https://github.com/argoproj/argo

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo/stable/manifests/install.yaml

2. Install the argocd CLI

VERSION=$(curl --silent "https://api.github.com/repos/argoproj/argo-cd/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')

sudo curl --silent --location -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$VERSION/argocd-linux-amd64

sudo chmod +x /usr/local/bin/argocd

3. Argo CD UI is exposed as a service. Change type to load balancer and get the end point for login

k get svc -n argocd
k patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'


4. Get the password for ArgoCD Api server

kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2

5. Login to the ArgoCD server using cli

 argocd login <ServerEndpointHost> --username admin --password <Password> --insecure

6. Apply the current context to ArgoCD

CONTEXT_NAME=`kubectl config view -o jsonpath='{.contexts[].name}'`
argocd cluster add $CONTEXT_NAME 

7. Apply an App to the ArgoCD

kubectl create namespace ecsdemo-nodejs
argocd app create ecsdemo-nodejs --repo https://github.com/GITHUB_USERNAME/ecsdemo-nodejs.git --path kubernetes --dest-server https://kubernetes.default.svc --dest-namespace ecsdemo-nodejs

8. Check the applied app and sync 

argocd app get ecsdemo-nodejs
argocd app sync ecsdemo-nodejs

9. Update the app details in the Git and Sync changes to verify the CD works

10. Clean up
argocd app delete ecsdemo-nodejs
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl delete ns argocd
kubectl delete ns ecsdemo-nodejs

