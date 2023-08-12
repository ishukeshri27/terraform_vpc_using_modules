variable "vpc_cidr_block" {
  type        = string
  description = "cidr block provided for the VPC"
}

variable "instance_tenancy" {
  type        = string
  description = "The tenancy associated with the instances in the VPC"
}

variable "vpc_name" {
  type        = string
  description = "name of the VPC"
}

variable "availability_zone" {
  type        = list(string)
  description = "List of availability zones to use for your VPC"
}

variable "web_subnet_cidr" {
  type        = list(string)
  description = "list of subnets to associate with the web subnets"
}

variable "app_subnet_cidr" {
  type        = list(string)
  description = "list of subnets to associate with the app subnets"
}

variable "db_subnet_cidr" {
  type        = list(string)
  description = "list of subnets to associate with the db subnets"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "specifies whether to enable nat gateway or not"
}

variable "internet_alb_cidr" {
  type        = list(string)
  description = "The ip addresses to which our application is exposed on the internet"
}

variable "app_tier_port" {
  type        = number
  description = "The port at which our backend app is running"
}

variable "db_tier_port" {
  type        = number
  description = "The port at which our database is running"
}