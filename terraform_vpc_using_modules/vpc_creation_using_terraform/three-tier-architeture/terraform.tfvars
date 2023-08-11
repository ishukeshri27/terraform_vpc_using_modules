vpc_cidr_block = "11.0.0.0/16"
instance_tenancy = "default"
vpc_name = "pres-vpc"
availability_zone = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
web_subnet_cidr = [ "11.0.0.0/20", "11.0.16.0/20", "11.0.32.0/19" ]
app_subnet_cidr = [ "11.0.64.0/19","11.0.96.0/19","11.0.128.0/19" ]
db_subnet_cidr = [ "11.0.160.0/19","11.0.192.0/19","11.0.224.0/19" ]
enable_nat_gateway = true
internet_alb_cidr = ["0.0.0.0/0"]
app_tier_port = 8080
db_tier_port = 5432