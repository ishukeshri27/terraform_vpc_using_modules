#public subnet
resource "aws_subnet" "web_subnet" {
    vpc_id = var.vpc_id
    count = length(var.availability_zone)
    availability_zone = var.availability_zone[count.index]
    cidr_block = var.web_subnet_cidr[count.index]
    tags = {
      "Name" = "${var.vpc_name}-web-public-subnet-${var.availability_zone[count.index]}"
    }
}

resource "aws_subnet" "app_subnet" {
    vpc_id = var.vpc_id
    count = length(var.availability_zone)
    availability_zone = var.availability_zone[count.index]
    cidr_block = var.app_subnet_cidr[count.index]
    tags = {
      "Name" = "${var.vpc_name}-app-private-subnet-${var.availability_zone[count.index]}"
    }
}

resource "aws_subnet" "db_subnet" {
    vpc_id = var.vpc_id
    count = length(var.availability_zone)
    availability_zone = var.availability_zone[count.index]
    cidr_block = var.db_subnet_cidr[count.index]
    tags = {
      "Name" = "${var.vpc_name}-db-private-subnet-${var.availability_zone[count.index]}"
    }
}