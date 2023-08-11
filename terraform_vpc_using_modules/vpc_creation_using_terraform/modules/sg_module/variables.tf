variable "vpc_id" {
    description = "The id of the VPC which all the security groups belong to"
}

variable "internet_alb_cidr" {
    description = "The ip addresses to which our application is exposed on the internet"
}

variable "vpc_name" {
    description = "The name of the VPC which all the security groups belong to"
}

variable "app_tier_port" {
    description = "The port at which our backend app is running"
}

variable "db_tier_port" {
    description = "The port at which our database is running"
}