# spoke1-network

# Spoke 1 Network

This repository has one Terraform root at its top level and creates the spoke network foundation through phase 4:

- `modules/vpc`: private spoke VPC, subnets, route tables, and associations. NAT is disabled by default.
- `modules/transit-gateway-attachment`: spoke VPC attachment to the shared hub TGW.
- `modules/vpc-tgw-routes`: routes spoke private subnet traffic to the hub through the TGW.
- `modules/vpc-endpoints`: interface endpoints for AWS services and an S3 gateway endpoint.

## Deployment

1. Copy `terraform.tfvars.example` to `terraform.tfvars`; set `transit_gateway_id` and `ram_resource_share_arn` from the hub outputs, and review CIDRs, AZs, and the RAM invitation setting.
2. Configure this repository's S3 backend and state locking before using remote state. Backend configuration is intentionally not hard-coded yet.
3. Run `terraform init`, `terraform plan`, and `terraform apply` from this directory.
4. Provide `spoke_transit_gateway_attachment_id` from `terraform output` to the hub root, then apply the hub root again to complete TGW routing.

For accounts in the same AWS Organization, RAM shares are normally auto-accepted; set `accept_ram_share_invitation = false` in that case. For an account outside the Organization, enable external principals in the hub and accept the invitation here.

If resources were already applied from old phase roots, migrate or import their Terraform state before applying this consolidated root to avoid duplicate resource creation. Connectivity tests and application resources are intentionally outside this repository root.  