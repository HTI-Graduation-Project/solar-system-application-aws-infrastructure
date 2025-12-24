# Basic Network Config
variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "solar-app"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

# Instance Types
variable "bastion_host_type" {
  description = "Instance type for Bastion Host"
  type        = string
  default     = "t2.medium"
}

variable "worker_node_type" {
  description = "Instance type for EKS Worker Nodes"
  type        = string
  default     = "t2.medium"
}

# EKS Scaling Config
variable "worker_node_desired" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 1
}

variable "worker_node_min" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "worker_node_max" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 2
}

variable "eks_name" {
  description = "Name of the EKS Cluster"
  type        = string
  default     = "solar-system-application"
}

variable "eks_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.33"
}
