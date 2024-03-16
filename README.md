# Terraform Super Mario

Infinite Mario in HTML5 JavaScript - using Canvas and Audio elements

## Description

Run with mapping container's 8080 port, and use your navigator http://localhost:8600:

```sh
docker run -d -p 8600:8080 ghcr.io/adefemi171/mario-terraform:latest
```

## Deploying on a Kubernetes Cluster using Minikube

### Requirements for Minikube

The following tools are required for deploying the mario game on Minikube:

- `docker` (up and running)
- `terraform`
- `minikube`

The bootstrapping and configuration of cluster can be performed with the command:

```sh
cd minikube/
terraform init
terraform apply -var-file=terraform.tfvars
```

To update the cluster, there are variables that can be changed, and it is located in the [terraform.tfvars](minikube/terraform.tfvars).

## Access the mario game

The service in which the mario game is running can be accessed by port-forwarding the service to the local machine. 

1. Firstly get the name of the pod in which the service is running, it should start with `mario-deployment-*`. This can be done by running the following command:

```sh
kubectl get pods -A
```

The following command can be used to port-forward the service:

```sh
kubect port-forward <pod_name> 8600:8080
```
