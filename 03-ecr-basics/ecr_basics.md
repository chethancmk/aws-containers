# ECR Basics
**1. Delete the repository if it already exists**

    aws ecr delete-repository --repository-name aws-containers/svca
  
**2. Create ECR Repository with Encryption**

    aws ecr create-repository \
    --repository-name aws-containers/svca 
    --encryption-configuration encryptionType=AES256 \
    --image-scanning-configuration scanOnPush=true

**3.  Pull your docker hub image locally for tagging**

    docker pull chethancmk/svca

**4. Login to ECR**

    aws ecr get-login-password \
    --region ap-south-1 | docker login --username AWS\
    --password-stdin 895300689201.dkr.ecr.ap-south-1.amazonaws.com

**5. Tag the Image for ECR**

    docker tag chethancmk/svca:latest 895300689201.dkr.ecr.ap-south-1.amazonaws.com/aws-containers/svca:latest
    docker images
    docker push 895300689201.dkr.ecr.ap-south-1.amazonaws.com/aws-containers/svca:latest

**6. Security demo of docker pull when logged out.**

    docker logout 895300689201.dkr.ecr.ap-south-1.amazonaws.com
    docker pull 895300689201.dkr.ecr.ap-south-1.amazonaws.com/aws-containers/svca:latest
 

**7. Check the vulnerability details in the portal**

> https://aws.amazon.com/blogs/containers/amazon-ecr-native-container-image-scanning/
> 
>  https://www.youtube.com/watch?v=y6NI_K96DRs
> 
> ECR Image Scanning Script :
> https://github.com/adamjkeller/ecr-image-scanning-script

**8. API for the ECR Scan Findings**

    aws ecr describe-image-scan-findings --repository-name aws-containers/svca --image-id imageTag=latest --region ap-south-1

> ECR Migration of images check the following library 
> https://pypi.org/project/aws-ecr-migration/

