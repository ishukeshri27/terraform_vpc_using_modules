module "vpc" {
    source = "../../modules/vpc_module"
    vpc_cidr_block = var.vpc_cidr_block
    instance_tenancy = var.instance_tenancy
    vpc_name = var.vpc_name
}

module "igw" {
    source = "../../modules/igw_module"
    vpc_id = module.vpc.vpc_id
    vpc_name = var.vpc_name
}

module "subnet" {
    source = "../../modules/subnet_module"
    vpc_id = module.vpc.vpc_id
    vpc_name = module.vpc.vpc_name
    availability_zone = var.availability_zone
    web_subnet_cidr = var.web_subnet_cidr
    app_subnet_cidr = var.app_subnet_cidr
    db_subnet_cidr = var.db_subnet_cidr
}

module "route_table" {
    source = "../../modules/route_table_module"
    vpc_id = module.vpc.vpc_id
    vpc_name = module.vpc.vpc_name
    internet_gateway_id = module.igw.pres_igw_id
    web_subnet_id = module.subnet.web_subnet_id
    app_subnet_id = module.subnet.app_subnet_id
    db_subnet_id = module.subnet.db_subnet_id
    enable_nat_gateway = var.enable_nat_gateway
    nat_gateway_id = module.nat_gateway.nat_gateway_id[0]
}

module "nat_gateway" {
    source = "../../modules/nat_gateway_module"
    vpc_name = module.vpc.vpc_name
    enable_nat_gateway = var.enable_nat_gateway
    subnet_id = module.subnet.web_subnet_id[0]
    elastic_ip_id = module.elastic_ip.elastic_ip_id[0]
}

module "elastic_ip" {
    source = "../../modules/elastic_ip_module"
    enable_nat_gateway = var.enable_nat_gateway
    vpc_name = module.vpc.vpc_name
}

module "security_group" {
    source = "../../modules/sg_module"
    vpc_id = module.vpc.vpc_id
    vpc_name = module.vpc.vpc_name
    internet_alb_cidr = var.internet_alb_cidr
    app_tier_port = var.app_tier_port
    db_tier_port = var.db_tier_port
}

