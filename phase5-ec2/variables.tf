variable "aws_region" {
  description = "AWS region containing the spoke VPC"
  type        = string
  default     = "ap-south-1"
}

variable "spoke_vpc_id" {
  description = "ID of the deployed spoke VPC"
  type        = string
}

variable "spoke_private_subnet_id" {
  description = "ID of a private subnet in the spoke VPC"
  type        = string
}

variable "spoke_vpc_cidr" {
  description = "Spoke VPC CIDR for outbound HTTPS to its interface endpoints"
  type        = string
  default     = "10.1.0.0/16"
}

variable "tags" {
  description = "Tags applied to the Phase 5 instance and security group"
  type        = map(string)
  default     = {}
}
