variable "name" {
  description = "Name prefix for endpoint resources"
  type        = string
}

variable "aws_region" {
  description = "AWS region containing the VPC"
  type        = string
}

variable "vpc_id" {
  description = "Spoke VPC ID"
  type        = string
}

variable "vpc_cidr" {
  description = "Spoke VPC CIDR used to restrict endpoint ingress"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnets for interface endpoints"
  type        = list(string)
}

variable "private_route_table_ids" {
  description = "Private route tables for the S3 gateway endpoint"
  type        = list(string)
}

variable "interface_endpoint_services" {
  description = "AWS service suffixes for interface endpoints"
  type        = set(string)
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}  