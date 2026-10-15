output "instance_id" {
  description = "Phase 5 spoke EC2 instance ID"
  value       = aws_instance.this.id
}

output "instance_private_ip" {
  description = "Phase 5 spoke EC2 private IP address"
  value       = aws_instance.this.private_ip
}
