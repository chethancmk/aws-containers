
# CreateECR Repository with Encryption
aws ecr create-repository --repository-name aws-containers/mynginx --encryption-configuration encryptionType=AES256

# Pull your docker hub image
docker pull chethancmk/mynginx:1.0

# Login to ECR
aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 895300689201.dkr.ecr.ap-south-1.amazonaws.com
docker tag chethancmk/mynginx:1.0 895300689201.dkr.ecr.ap-south-1.amazonaws.com/aws-containers/mynginx:latest
docker push 895300689201.dkr.ecr.ap-south-1.amazonaws.com/aws-containers/mynginx:latest

docker logout 895300689201.dkr.ecr.ap-south-1.amazonaws.com
docker pull 895300689201.dkr.ecr.ap-south-1.amazonaws.com/aws-containers/mynginx:latest







