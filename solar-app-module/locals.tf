locals {

  AZ1 = "${var.region}a" 
  AZ2 = "${var.region}b" 

  public_subnet_AZ1_name  = "${var.vpc_name}-${local.AZ1}-public"
  public_subnet_AZ2_name  = "${var.vpc_name}-${local.AZ2}-public"
  private_subnet_AZ1_name = "${var.vpc_name}-${local.AZ1}-private"
  private_subnet_AZ2_name = "${var.vpc_name}-${local.AZ2}-private"
}