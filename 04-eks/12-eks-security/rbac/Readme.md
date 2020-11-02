## RBAC

Create a dev user and provide only access to dev names space in the eks cluster. 

 1. Create a namespace for dev

	    kubectl create namespace dev
	    kubectl create namespace prod
	    kubectl create deploy dev-nginx --image=nginx -n dev
	    kubectl create deploy prod-nginx --image=nginx -n prod
	    kubectl get all -n dev

  

2. Create IAM user - dev

	    aws iam create-user --user-name dev
	    aws iam create-access-key --user-name dev | tee /tmp/create_output.json

3. Create Script to switch to dev user

	    cat << EoF > dev_creds.sh
	    export AWS_SECRET_ACCESS_KEY=$(jq -r .AccessKey.SecretAccessKey /tmp/create_output.json)
	    export AWS_ACCESS_KEY_ID=$(jq -r .AccessKey.AccessKeyId /tmp/create_output.json)
	    EoF

4. Update AWS Config Auth Map to add the user

	    kubectl get configmap -n kube-system aws-auth -o yaml > aws-auth.yaml

5. Apply Changes to the config map

	    mapUsers: |
	    - userarn: arn:aws:iam::123456789:user/dev
	    username: dev-user
	    kubectl apply -f aws-auth.yaml

6. Switch to the dev user and verify

	    . dev_creds.sh
	    aws sts get-caller-identity  x
	    kubectl get pods -n dev

7. Unset the dev user keys

		unset AWS_SECRET_ACCESS_KEY
		unset AWS_ACCESS_KEY_ID
		aws sts get-caller-identity  

9. Create Role and Role Binding for dev user

		kubectl apply -f dev-role.yaml
		kubectl apply -f dev-role-binding.yaml  

10. Switch to the dev user again to verify the effect of the role.

		. dev_creds.sh; aws sts get-caller-identity
		kubectl get pods -n dev
	
11. CleanUp all the objects

	    unset AWS_SECRET_ACCESS_KEY
	    unset AWS_ACCESS_KEY_ID

	    k delete ns dev
	    k delete ns prod

	    aws iam delete-access-key --user-name=dev --access-key-id=$(jq -r .AccessKey.AccessKeyId /tmp/create_output.json)

	    aws iam delete-user --user-name dev
	    rm /tmp/create_output.json
	    rm dev_creds.sh

12. Remove the user mapping from the AWS config auth map

	    kubectl get configmap -n kube-system aws-auth -o yaml > aws-auth.yaml
	    k apply -f aws-auth.yaml
