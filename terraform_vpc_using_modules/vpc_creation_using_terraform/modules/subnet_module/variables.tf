variable "vpc_id" {
    description = "The id of the VPC to create subnets in"
}

variable "availability_zone" {
    description = "List of availability zones to use for your VPC"
}

variable "web_subnet_cidr" {
    description = "list of subnets to associate with the web subnets"
}

variable "app_subnet_cidr" {
    description = "list of subnets to associate with the app subnets"
}

variable "db_subnet_cidr" {
    description = "list of subnets to associate with the db subnets"
}

variable "vpc_name" {
    description = "name of the VPC to create subnets in"
}


