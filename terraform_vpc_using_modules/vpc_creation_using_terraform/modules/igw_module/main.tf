resource "aws_internet_gateway" "pres_igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}