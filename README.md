# EKS Enablement

### 0. Preparation

1. Prepare VM with tools (A-prep-vm.sh)
	a. git client
	b. docker
	c. python3
	d. nodejs
	e. awscli upgrade

2. Install CLI tools (B-cli_tools.sh)
	a. jq
	b. yq

4. Environment Variables for AWS Account (C-env-init_scripts.sh)

  ### 1. Docker Introduction
1. Docker Basic Commands
2. Docker Custom Docker Image
3. Docker Volume Mount
4. Docker Push - Docker Hub
 
### 2. Kubernetes Introduction
1. kubectl config
2. Pods/Deployments/Services

### 3. ECR
1. Create ECR
2. Repo Login and push image
3. ECR On Push Scanning

### 4. EKS Control Plane
1. Creating EKS Cluster
2. Create Script
3. Accessing Cluster
4. Additional Cluster Users
5. Upgrade EKS

### 5. EKS Data Plane (Node Groups)
1. Managed
2. Unmanaged
3. SPOT
4. Fargate
5. Windows
6. Bottlerocket
  

### 6. Kubernetes Dashboard
1. kubernetes Dashboard
2. kubenav Dashboard
 

### 7. EKS HealthChecks
1. Liveness Probe
2. Readiness Probe

### 8. EKS Scaling
1. Horizontal Pod Scaling
2. Cluster Scaling

