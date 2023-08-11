output "vpc_route_table_id" {
    value = aws_vpc.pres_vpc.main_route_table_id
}

output "vpc_id" {
    value = aws_vpc.pres_vpc.id
}

output "vpc_name" {
    value = aws_vpc.pres_vpc.tags["Name"]
}