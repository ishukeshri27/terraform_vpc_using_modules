variable "elastic_ip_id" {
    description = "Id of elastic ip"
}

variable "subnet_id" {
    description = "id of the public subnet that the nat gateway belongs to"
}

variable "enable_nat_gateway" {
    description = "specifies whether to enable nat gateway or not"
}

variable "vpc_name" {
    description = "name of the VPC where the subnet attached to nat gateway belongs"
}