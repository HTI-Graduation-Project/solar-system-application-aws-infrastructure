output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnets_AZ1" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public_AZ1.id
}
output "public_subnets_AZ2" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public_AZ2.id
}

output "private_subnets_AZ1" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private_AZ1.id
}

output "private_subnets_AZ2" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private_AZ2.id
}

output "bastion_public_ip" {
  description = "Public IP of the Bastion Host"
  value       = aws_instance.bastion_host_ec2.public_ip
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = aws_eks_cluster.eks.endpoint
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = aws_eks_cluster.eks.name
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}