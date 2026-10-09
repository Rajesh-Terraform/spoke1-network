variable "aws_region" {
  description = "AWS region where the spoke infrastructure is created"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the spoke VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "subnets" {
  description = "Private subnet configuration for the spoke VPC"

  type = map(object({
    cidr = string
    az   = string
  }))

  default = {
    private_1 = {
      cidr = "10.1.0.0/24"
      az   = "ap-south-1a"
    }

    private_2 = {
      cidr = "10.1.1.0/24"
      az   = "ap-south-1b"
    }
  }
}

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

variable "tags" {
  description = "Common tags for AWS resources"
  type        = map(string)

  default = {
    Project     = "Hub-Spoke"
    Environment = "spoke"
    ManagedBy   = "Terraform"
  }
}  