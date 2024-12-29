Steps for Deploying the static website

Ensure we have the following tools installed:
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
1. Install Helm
Run the following commands to install Helm on Ubuntu:

curl https://get.helm.sh/helm-v3.10.2-linux-amd64.tar.gz -o helm-v3.10.2-linux-amd64.tar.gz
tar -zxvf helm-v3.10.2-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
Verify the installation:
helm version

2. Add Prometheus Helm Chart Repository
Prometheus is available via the prometheus-community Helm chart repository. To add this repository, run:

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
Update the Helm repositories to get the latest charts:

helm repo update
3. Install Prometheus using Helm
You can now install Prometheus on your Kubernetes cluster using the following command:

helm install prometheus prometheus-community/kube-prometheus-stack

4. Verify the Installation
Once the Helm install command completes, you can verify that Prometheus and its components have been deployed successfully using:

kubectl get all
5. Access Prometheus UI
If you're using a local Kubernetes cluster, you can port-forward the Prometheus server to access the Prometheus UI:

kubectl port-forward service/prometheus-operated 9090:9090 --address 0.0.0.0

6. Access Grafana UI
The kube-prometheus-stack chart also includes Grafana, which provides a nice dashboard for Prometheus metrics. To access Grafana, you can port-forward it as well:

kubectl port-forward  service/prometheus-grafana 3000:80 --address 0.0.0.0

Now, you can access Grafana by going to http://localhost:3000 in your browser.

After deployment, we can access the application using the LoadBalancer DNS provided by Kubernetes.

http://aa4956a05badc4d90be096d72883ee81-430633754.us-west-1.elb.amazonaws.com

![image](https://github.com/user-attachments/assets/7142b7c8-1b77-484b-b005-7e2ecbe7e5f1)
