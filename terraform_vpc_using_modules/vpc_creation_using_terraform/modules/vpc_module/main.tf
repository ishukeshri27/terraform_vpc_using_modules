resource "aws_vpc" "pres_vpc" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = var.instance_tenancy
    tags = {
        Name = var.vpc_name
    }
}