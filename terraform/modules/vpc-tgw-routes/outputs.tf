output "route_ids" {
  description = "IDs of the routes created"
  value       = { for route in aws_route.this : route.route_table_id => route.id }
}
