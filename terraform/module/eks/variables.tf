variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "static-site-cluster"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs"
  type        = list(string)
}
