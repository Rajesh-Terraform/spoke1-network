output "interface_endpoint_ids" {
  description = "Interface endpoint IDs keyed by AWS service suffix"
  value       = { for service, endpoint in aws_vpc_endpoint.interface : service => endpoint.id }
}

output "s3_endpoint_id" {
  description = "S3 gateway endpoint ID"
  value       = aws_vpc_endpoint.s3.id
}  