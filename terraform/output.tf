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

output "cluster_name&version&region" {
  value = [
    aws_eks_cluster.eks.name,
    aws_eks_cluster.eks.version,
    aws_eks_cluster.eks.region
  ]
}

output "cluster_nodes" {
  value = [
    aws_eks_node_group.general.
    aws_eks_node_group.general.instance_type,
    aws_eks_node_group.general.status
  ]
}

