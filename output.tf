output "vpc_name" {
  value = aws_vpc.main.id
}

output "basion_host_ec2_public_dns" {
  value = aws_instance.basion_host_ec2.public_dns
}
output "public_subnet_ids" {
  value = [
    aws_subnet.public_AZ1.id,
    aws_subnet.public_AZ2.id
  ]
}


output "cluster_name_version_region" {
  value = [
    aws_eks_cluster.eks.name,
    aws_eks_cluster.eks.version,
    aws_eks_cluster.eks.region
  ]
}


