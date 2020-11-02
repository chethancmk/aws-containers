## IRSA  

Provide Pod with a read only access to S3.

1. Update OIDC Identity provider for cluster and check in console.

		eksctl utils associate-iam-oidc-provider --cluster uipl17 --approve

2. Use the existing S3 read only policy provided by AWS.

		Policy Name : "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"

3. Create a Role with the policy and associate to Service Account

	    eksctl create iamserviceaccount \
	    --name s3-read \
	    --namespace default \
	    --cluster uipl17 \
	    --attach-policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess \
	    --approve \
	    --override-existing-serviceaccounts
 
4. Check the created service account

	    kubectl get sa s3-read
	    kubectl describe sa s3-read

5. Create a deployment with awscli preinstalled and update serviceAccountName

	    k create deployment awscli --image sdscello/awscli
	    k exec -it awscli-555459b7b-9hzhz -- bin/sh
	    
	    printenv
	    aws s3 ls

6. Cleanup

		k delete deployment awscli
		
		eksctl delete iamserviceaccount \
		--name s3-read \
		--namespace default \
		--cluster uipl17 \
		--wait

