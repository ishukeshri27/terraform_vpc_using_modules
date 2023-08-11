resource "aws_security_group" "internet_alb_sg" {
    vpc_id = var.vpc_id
    description = "Allows traffic from internet to the internet facing alb"
    ingress {
        protocol = "tcp"
        from_port = 80
        to_port = 80
        cidr_blocks = var.internet_alb_cidr
    }
    ingress {
        protocol = "tcp"
        from_port = 443
        to_port = 443
        cidr_blocks = var.internet_alb_cidr
    }
    tags = {
      Name = "${var.vpc_name}-internet-alb-sg"
    }
}

resource "aws_security_group" "web_subnet_sg" {
    vpc_id = var.vpc_id
    description = "Allows traffic from internet facing alb to the instances in the web tier"
    ingress {
        protocol = "tcp"
        from_port = 80
        to_port = 80
        security_groups = [ aws_security_group.internet_alb_sg.id ]
    }
    ingress {
        protocol = "tcp"
        from_port = 443
        to_port = 443
        security_groups = [ aws_security_group.internet_alb_sg.id ]
    }
    tags = {
      Name = "${var.vpc_name}-web-subnet-sg"
    }
}

resource "aws_security_group" "internal_alb_sg" {
    vpc_id = var.vpc_id
    description = "Allows traffic from web tier"
    ingress {
        protocol = "tcp"
        from_port = var.app_tier_port
        to_port = var.app_tier_port
        security_groups = [ aws_security_group.web_subnet_sg.id ]
    }
    tags = {
      Name = "${var.vpc_name}-internal-alb-sg"
    }
}

resource "aws_security_group" "app_subnet_sg" {
    vpc_id = var.vpc_id
    description = "Allows traffic from internal alb to intances in app tier"
    ingress {
        protocol = "tcp"
        from_port = var.app_tier_port
        to_port = var.app_tier_port
        security_groups = [ aws_security_group.internal_alb_sg.id]
    }
    tags = {
      Name = "${var.vpc_name}-app-subnet-sg"
    }
}

resource "aws_security_group" "db_subnet_sg" {
    vpc_id = var.vpc_id
    description = "Allows traffic from app tier to db tier"
    ingress {
        protocol = "tcp"
        from_port = var.db_tier_port
        to_port = var.db_tier_port
        security_groups = [ aws_security_group.app_subnet_sg.id ]
    }
    tags = {
      Name = "${var.vpc_name}-db-subnet-sg"
    }
}