variable "name" {
  description = "Spoke attachment name"
  type        = string
}

variable "transit_gateway_id" {
  description = "Shared hub Transit Gateway ID"
  type        = string
}

variable "vpc_id" {
  description = "Spoke VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "One private subnet per spoke AZ for the attachment"
  type        = list(string)
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}   