# spoke1-network

# Spoke 1 Network

The Terraform root is in `terraform/` and creates the spoke network foundation through phase 4:

- `terraform/modules/vpc`: private spoke VPC, subnets, route tables, and associations. NAT is disabled by default.
- `terraform/modules/transit-gateway-attachment`: spoke VPC attachment to the shared hub TGW.
- `terraform/modules/vpc-tgw-routes`: routes spoke private subnet traffic to the hub through the TGW.
- `terraform/modules/vpc-endpoints`: interface endpoints for AWS services and an S3 gateway endpoint.

## Deployment

1. Copy `terraform/terraform.tfvars.example` to `terraform/terraform.tfvars`; set `transit_gateway_id` and `ram_resource_share_arn` from the hub outputs, and review CIDRs, AZs, and the RAM invitation setting.
2. Confirm the S3 bucket configured in `terraform/backend.tf` exists and that your AWS identity can read and write the state object and use its lock file.
3. Run `terraform init`, `terraform plan`, and `terraform apply` from `terraform/`.
4. Provide `spoke_transit_gateway_attachment_id` from `terraform output` to the hub root, then apply the hub root again to complete TGW routing.
5. For GitHub Actions, configure repository secrets `TG_TRANSIT_GATEWAY_ID` and `RAM_RESOURCE_SHARE_ARN`. The workflow assumes `arn:aws:iam::434097521299:role/testingdummy` through GitHub OIDC; configure that role's trust policy for this repository and grant it the required spoke-resource permissions plus access to the S3 state bucket and state lock file. Pull requests run format and validation checks only. Pushes to `main` and manual runs create a plan; applying requires the repository variable `TF_APPLY_ENABLED` to be set to `true`.

For accounts in the same AWS Organization, RAM shares are normally auto-accepted; keep `accept_ram_share_invitation = false` in that case. The GitHub Actions workflow sets this to `false` because no pending invitation exists for the current share. For a new share outside the Organization with a pending invitation, enable external principals in the hub and set `accept_ram_share_invitation = true` for the spoke deployment.

If resources were already applied from old phase roots, migrate or import their Terraform state before applying this consolidated root to avoid duplicate resource creation. Connectivity tests and application resources are intentionally outside this repository root.  