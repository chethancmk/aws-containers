curl -o aws-auth-cm.yaml https://amazon-eks.s3.us-west-2.amazonaws.com/cloudformation/2020-08-12/aws-auth-cm.yaml

kubectl describe configmap -n kube-system aws-auth

kubectl apply -f aws-auth-cm.yaml 