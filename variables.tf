variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "web-dev-cluster"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "web-dev-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "Availability zones for subnets"
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for web assets"
  type        = string
  default     = "web-dev-assets-bucket"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}
