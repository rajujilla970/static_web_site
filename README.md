Steps for Deploying the static website

Ensure you have the following tools installed:
Terraform
Docker
kubectl
AWSCLI
Provision Cloud Infrastructure

Configure your Terraform provider (AWS).
Run following commands for terraform files
terraform init
terraform apply to provision the Kubernetes cluster.

Build and Push Docker Image
Create a Dockerfile for your static application.
Build the image: docker build -t static-web-app .
Push the image to a container registry (Docker Hub).
Deploy the Application to Kubernetes

Apply the Kubernetes YAML files:
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
Set Up Monitoring

Apply the Prometheus configuration and deployment files:
kubectl apply -f prometheus-configmap.yaml
kubectl apply -f prometheus-deployment.yaml
kubectl expose deployment prometheus --type=LoadBalancer --name=prometheus-service
Access the Web Application

After deployment, you can access the application using the LoadBalancer IP provided by Kubernetes.
Check the Prometheus dashboard for monitoring.
