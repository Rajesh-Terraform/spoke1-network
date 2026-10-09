variable "transit_gateway_id" {
  description = "Transit Gateway ID created in the Hub account"
  type        = string
}

variable "ram_resource_share_arn" {
  description = "RAM Resource Share ARN created in the Hub account"
  type        = string
}

variable "accept_ram_share_invitation" {
  description = "Accept the RAM resource share invitation"
  type        = bool
  default     = true
}    