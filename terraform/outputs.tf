output "spoke_vpc_id" {
  description = "Spoke VPC ID"
  value       = module.spoke_vpc.vpc_id
}

output "spoke_vpc_cidr" {
  description = "Spoke VPC CIDR"
  value       = module.spoke_vpc.vpc_cidr
}

output "spoke_private_subnet_ids" {
  description = "Spoke private subnet IDs"
  value       = module.spoke_vpc.private_subnet_ids
}

output "spoke_private_route_table_ids" {
  description = "Spoke private route table IDs"
  value       = module.spoke_vpc.private_route_table_ids
}

output "spoke_transit_gateway_attachment_id" {
  description = "Spoke TGW attachment ID; provide this to the hub root for TGW routing"
  value       = module.transit_gateway_attachment.attachment_id
}

output "interface_vpc_endpoint_ids" {
  description = "Interface endpoint IDs keyed by AWS service suffix"
  value       = module.vpc_endpoints.interface_endpoint_ids
}

output "s3_vpc_endpoint_id" {
  description = "S3 gateway endpoint ID"
  value       = module.vpc_endpoints.s3_endpoint_id
}
