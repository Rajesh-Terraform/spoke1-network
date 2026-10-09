module "spoke_vpc" {
  source = "./modules/vpc"

  name               = var.spoke_vpc_name
  cidr_block         = var.spoke_vpc_cidr
  subnets            = var.subnets
  enable_nat_gateway = false
  tags               = var.tags
}  