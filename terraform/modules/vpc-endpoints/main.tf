resource "aws_security_group" "interface_endpoints" {
  name        = "${var.name}-interface-endpoints"
  description = "HTTPS from the spoke VPC to interface endpoints"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTPS from the spoke VPC"
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = [var.vpc_cidr]
  }

  tags = merge(var.tags, {
    Name = "${var.name}-interface-endpoints"
  })
}

resource "aws_vpc_endpoint" "interface" {
  for_each = var.interface_endpoint_services

  vpc_id              = var.vpc_id
  service_name        = "com.amazonaws.${var.aws_region}.${each.value}"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true
  subnet_ids          = var.private_subnet_ids
  security_group_ids  = [aws_security_group.interface_endpoints.id]

  tags = merge(var.tags, {
    Name = "${var.name}-${replace(each.value, ".", "-")}-endpoint"
  })
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = var.private_route_table_ids

  tags = merge(var.tags, {
    Name = "${var.name}-s3-endpoint"
  })
}   