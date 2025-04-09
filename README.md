# Web Development Infrastructure on AWS

This project sets up a complete infrastructure for web development using AWS services in the eu-north-1 (Stockholm) region:

- Amazon EKS (Elastic Kubernetes Service) for container orchestration
- Amazon S3 for static web assets and file storage
- VPC with public and private subnets across multiple availability zones

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/) configured with credentials
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) for Kubernetes interaction

## Quick Start

1. Initialize Terraform:
```
terraform init

```

2. Review the execution plan:
 ```
terraform plan

```

3. Apply the configuration:
 ```
terraform apply

```

4. Configure kubectl to use the new cluster:
```

aws eks update-kubeconfig --region eu-north-1 --name web-dev-cluster

```

5. Verify the connection:
 ```
kubectl get nodes

```

## Infrastructure Components

- **VPC**: Isolated network with public and private subnets
- **EKS Cluster**: Managed Kubernetes service with t3.medium worker nodes
- **S3 Bucket**: Configured for web hosting with public read access

## Cleanup

To destroy all resources created by this configuration:

```
terraform destroy

```

## Notes

- The S3 bucket is configured with public read access for web hosting
- EKS cluster has public endpoint enabled for easier management
- NAT Gateway is used to allow private subnet resources to access the internet
