# Delete the repository if it already exists
aws ecr delete-repository --repository-name aws-containers/svca

# CreateECR Repository with Encryption
aws ecr create-repository --repository-name aws-containers/svca --encryption-configuration encryptionType=AES256 --image-scanning-configuration scanOnPush=true

# Pull your docker hub image
docker pull chethancmk/svca

# Login to ECR and push
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 895300689201.dkr.ecr.ap-south-1.amazonaws.com
docker tag chethancmk/svca:latest 895300689201.dkr.ecr.ap-south-1.amazonaws.com/aws-containers/svca:latest
docker images
docker push 895300689201.dkr.ecr.ap-south-1.amazonaws.com/aws-containers/svca:latest

# Security demo of docker pull when logged out.
docker logout 895300689201.dkr.ecr.ap-south-1.amazonaws.com
docker pull 895300689201.dkr.ecr.ap-south-1.amazonaws.com/aws-containers/svca:latest

# Check the vulnerability details in the portal
# https://aws.amazon.com/blogs/containers/amazon-ecr-native-container-image-scanning/
# https://www.youtube.com/watch?v=y6NI_K96DRs
# ECR Image Scanning Script : https://github.com/adamjkeller/ecr-image-scanning-script
# API for the Scan Findings
aws ecr describe-image-scan-findings --repository-name aws-containers/svca --image-id imageTag=latest --region ap-south-1


# ECR Migration of images check the following library
# https://pypi.org/project/aws-ecr-migration/

 






