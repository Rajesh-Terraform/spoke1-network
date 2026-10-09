# ---------------------------------------------------------
# Spoke VPC
# ---------------------------------------------------------

# ---------------------------------------------------------
# Transit Gateway
# ---------------------------------------------------------

module "transit_gateway" {
  source = "./modules/transit-gateway"

  name = var.transit_gateway_name

  description = var.transit_gateway_description

  amazon_side_asn = var.amazon_side_asn

  auto_accept_shared_attachments = var.auto_accept_shared_attachments

  default_route_table_association = var.default_route_table_association

  default_route_table_propagation = var.default_route_table_propagation

  dns_support = var.tgw_dns_support

  vpn_ecmp_support = var.vpn_ecmp_support

  tags = var.tags
}


# ---------------------------------------------------------
# AWS RAM Resource Share
# ---------------------------------------------------------

module "ram_share" {
  source = "./modules/ram-share"

  name = var.ram_share_name

  transit_gateway_arn = module.transit_gateway.transit_gateway_arn

  spoke_account_id = var.spoke_account_id

  allow_external_principals = var.allow_external_principals

  tags = var.tags
}


# ---------------------------------------------------------
# VPC -> Transit Gateway Attachment
# ---------------------------------------------------------

  


# ---------------------------------------------------------
# VPC Route Tables -> Transit Gateway  
# ---------------------------------------------------------

   