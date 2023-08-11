resource "aws_eip" "elastic_ip" {
    count = var.enable_nat_gateway ? 1 : 0
    vpc = true 
    tags = {
        Name = "${var.vpc_name}-nat-gateway-eip"
    }
}