output "spoke_vpc_id" {
  description = "Spoke VPC ID"
  value       = module.vpc.vpc_id
}

output "spoke_vpc_cidr" {
  description = "Spoke VPC CIDR"
  value       = module.vpc.vpc_cidr
}

output "spoke_private_subnet_ids" {
  description = "Spoke private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "spoke_private_route_table_ids" {
  description = "Spoke private route table IDs"
  value       = module.vpc.private_route_table_ids
}

output "transit_gateway_id" {
  description = "Transit Gateway ID"
  value       = module.transit_gateway.transit_gateway_id
}

output "ram_resource_share_arn" {
  description = "RAM resource share ARN"
  value       = module.ram_share.ram_resource_share_arn
}  