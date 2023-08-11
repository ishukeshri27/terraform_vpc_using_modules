variable "vpc_id" {
  description = "id of the VPC where the route table belongs"
}

variable "internet_gateway_id" {
    description = "id of the internet gateway"
}

variable "vpc_name" {
    description = "name of the VPC where the route table belongs"
}

variable "web_subnet_id" {
    description = "list of subnet ids of the web subnet"
}

variable "app_subnet_id" {
    description = "list of subnet ids of the app subnet"
}

variable "db_subnet_id" {
    description = "list of subnet ids of the db subnet"
}

variable "nat_gateway_id" {
    description = "id of the NAT gateway that routes through the private route table"
}

variable "enable_nat_gateway" {
    description = "specifies whether to enable the nat gateway or not"
}