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
5. For GitHub Actions, configure repository secrets `TG_TRANSIT_GATEWAY_ID` and `RAM_RESOURCE_SHARE_ARN`. The workflow assumes `arn:aws:iam::434097521299:role/testingdummy` through GitHub OIDC; configure that role's trust policy for this repository and grant it the required spoke-resource permissions plus access to the S3 state bucket and state lock file. Pull requests run format and validation checks only, without AWS credentials. Pushes to `main` and manual runs targeting `main` create a plan. A push applies only when the repository variable `TF_APPLY_ENABLED` is exactly `true`; a manual run applies only when its `apply` input is checked. Configure the `spoke-production` GitHub Environment with required reviewers so the apply job pauses for approval.

For accounts in the same AWS Organization, RAM shares are normally auto-accepted. The GitHub Actions workflow checks for a pending invitation and accepts it before Terraform planning; the Terraform accepter resource remains disabled to avoid failing when AWS has no pending invitation. Ensure the spoke OIDC role can call `ram:GetResourceShareInvitations`, `ram:AcceptResourceShareInvitation`, and `ec2:DescribeTransitGateways`.

If resources were already applied from old phase roots, migrate or import their Terraform state before applying this consolidated root to avoid duplicate resource creation. Connectivity tests and application resources are intentionally outside this repository root.  