variable "aws_region" {
  description = "AWS region for the spoke network"
  type        = string
  default     = "ap-south-1"
}

variable "spoke_vpc_name" {
  description = "Name prefix for spoke VPC resources"
  type        = string
  default     = "spoke1-network"
}

variable "spoke_vpc_cidr" {
  description = "IPv4 CIDR for the spoke VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "subnets" {
  description = "Spoke subnet definitions keyed by a stable subnet name"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    public            = bool
  }))
}

variable "transit_gateway_id" {
  description = "Transit Gateway ID output by the hub deployment"
  type        = string
}

variable "ram_resource_share_arn" {
  description = "RAM share ARN output by the hub deployment"
  type        = string
}

variable "accept_ram_share_invitation" {
  description = "Accept a pending RAM invitation; set false when the share is auto-accepted or already accepted"
  type        = bool
  default     = false
}

variable "hub_vpc_cidr" {
  description = "Hub VPC CIDR used for spoke routes"
  type        = string
  default     = "10.0.0.0/16"
}

variable "interface_endpoint_services" {
  description = "AWS interface endpoint service suffixes to create"
  type        = set(string)
  default = [
    "ssm",
    "ssmmessages",
    "ec2messages",
    "logs",
    "secretsmanager",
    "kms",
    "sts",
    "ecr.api",
    "ecr.dkr"
  ]
}

variable "tags" {
  description = "Common tags applied to spoke resources"
  type        = map(string)
  default     = {}
}
