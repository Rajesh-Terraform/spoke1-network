variable "route_table_ids" {
  description = "Route table IDs that should route to the Transit Gateway"
  type        = list(string)
}

variable "destination_cidr" {
  description = "Destination CIDR routed through the Transit Gateway"
  type        = string
}

variable "transit_gateway_id" {
  description = "Transit Gateway ID"
  type        = string
}
