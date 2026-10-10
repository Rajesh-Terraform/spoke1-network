output "route_ids" {
  description = "IDs of the routes created"
  value       = { for route_table_id, route in aws_route.this : route_table_id => route.id }
}
