resource "aws_route_table" "public_rt" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.internet_gateway_id
    }
    tags = {
      "Name" = "${var.vpc_name}-public-rt"
    }
}

resource "aws_route_table" "private_rt" {
    vpc_id = var.vpc_id
    tags = {
      "Name" = "${var.vpc_name}-private-rt"
    }
}

resource "aws_route_table_association" "web_public_rt_association" {
    count = length(var.web_subnet_id)
    subnet_id = var.web_subnet_id[count.index]
    route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "app_private_rt_association" {
    count = length(var.app_subnet_id)
    subnet_id = var.app_subnet_id[count.index]
    route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "db_private_rt_association" {
    count = length(var.db_subnet_id)
    subnet_id = var.db_subnet_id[count.index]
    route_table_id = aws_route_table.private_rt.id
}

resource "aws_route" "private_rt_route_nat" {
    count = var.enable_nat_gateway ? 1 : 0
    route_table_id = aws_route_table.private_rt.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = var.nat_gateway_id
}