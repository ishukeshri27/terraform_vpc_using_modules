resource "aws_nat_gateway" "nat_gateway" {
    count = var.enable_nat_gateway ? 1 : 0
    allocation_id = var.elastic_ip_id
    subnet_id = var.subnet_id
    tags = {
      "Name" = "${var.vpc_name}-nat-gateway"
    }
}