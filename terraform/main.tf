resource "aws_ram_resource_share_accepter" "transit_gateway" {
  count     = var.accept_ram_share_invitation ? 1 : 0
  share_arn = var.ram_resource_share_arn
}  