# LAMBDA FUNCTION For eks deployment
Update Config File with the required connection details

sed -i -e "s#\$EKS_CA#$(aws eks describe-cluster --name uipl18 --query cluster.certificateAuthority.data --output text)#g" ./config
sed -i -e "s#\$EKS_CLUSTER_HOST#$(aws eks describe-cluster --name uipl18 --query cluster.endpoint --output text)#g" ./config
sed -i -e "s#\$EKS_CLUSTER_NAME#uipl18#g" ./config
sed -i -e "s#\$EKS_CLUSTER_USER_NAME#lambda#g" ./config

kubectl get secrets
export SECRET_NAME=default-token-9qfbd

sed -i -e "s#\$TOKEN#$(kubectl get secret $SECRET_NAME -o json | jq -r '.data["token"]' | base64 -d)#g" ./config