module "spoke_vpc" {
  source = "./modules/vpc"

  name               = var.spoke_vpc_name
  cidr_block         = var.spoke_vpc_cidr
  subnets            = var.subnets
  enable_nat_gateway = false
  tags               = var.tags
}

resource "aws_ram_resource_share_accepter" "transit_gateway" {
  count = var.accept_ram_share_invitation ? 1 : 0

  share_arn = var.ram_resource_share_arn
}

module "transit_gateway_attachment" {
  source = "./modules/transit-gateway-attachment"

  name               = "${var.spoke_vpc_name}-tgw-attachment"
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = module.spoke_vpc.vpc_id
  subnet_ids         = module.spoke_vpc.private_subnet_ids
  tags               = var.tags

  depends_on = [aws_ram_resource_share_accepter.transit_gateway]
}

module "hub_routes" {
  source = "./modules/vpc-tgw-routes"

  route_table_ids    = module.spoke_vpc.private_route_table_ids
  destination_cidr   = var.hub_vpc_cidr
  transit_gateway_id = var.transit_gateway_id

  depends_on = [module.transit_gateway_attachment]
}

module "vpc_endpoints" {
  source = "./modules/vpc-endpoints"

  name                        = var.spoke_vpc_name
  aws_region                  = var.aws_region
  vpc_id                      = module.spoke_vpc.vpc_id
  vpc_cidr                    = var.spoke_vpc_cidr
  private_subnet_ids          = module.spoke_vpc.private_subnet_ids
  private_route_table_ids     = module.spoke_vpc.private_route_table_ids
  interface_endpoint_services = var.interface_endpoint_services
  tags                        = var.tags
}
