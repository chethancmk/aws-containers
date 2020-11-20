### EKS CI CD with Lamdba Deployment
1. Create a codecommit repo for the source code

	    aws codecommit create-repository --repository-name eks-cicd-repo --repository-description "EKS CICD using lambda" --region ap-south-1

2. Create a ECR Repo for the build images

		aws ecr create-repository --repository-name eks-cicd-repo --region ap-south-1

3. Add source code and check into the repo
		
		cd app
		git init
		git config --global credential.helper '!aws codecommit credential-helper $@'
		git config --global credential.UseHttpPath true
		git remote add origin https://git-codecommit.ap-south-1.amazonaws.com/v1/repos/eks-cicd-repo
		git add . && git commit -m "test sample app" && git push origin master
  
4. Install, Zip and Deploy the lambda function (Create a lambda role ekslambda with EKS,Cloudwatch permissions)
		
		cd ../LambdaKubeClient/
		npm install
		zip -r lambda-package_v1.zip .
		aws lambda delete-function --function-name LambdaKubeClient
		aws lambda create-function --function-name LambdaKubeClient --runtime nodejs12.x --role arn:aws:iam::895300689201:role/ekslambda --handler index.handler --zip-file fileb://lambda-package_v1.zip --timeout 10 --memory-size 128

5. Open the console for lambda function and Update the lambda function to include the following environment variables

		EKS_CA = aws eks describe-cluster --name uipl18 --query cluster.certificateAuthority.data --output text
		EKS_CLUSTER_HOST = aws eks describe-cluster --name uipl18 --query cluster.endpoint --output text
		EKS_CLUSTER_NAME = Cluser Name
		EKS_CLUSTER_USER_NAME = lambda
		EKS_TOKEN = kubectl get secrets + kubectl get secret default-token-nglvg -o json | jq -r '.data["token"]' | base64 -d
  
6. Apply the lambda RBAC role binding to have cluster admin access used by lambda

		k apply -f service_account.yaml

7. Create a code pipeline with the Source Repo, Build and Lambda Stages.

8. Test the deployed changes.
