# Phase 5 - Spoke EC2

This independent Terraform root creates one private Amazon Linux EC2 instance
in the deployed spoke VPC, with an instance profile for Systems Manager
Session Manager. It does not create or change VPC routes, Transit Gateway
routes, attachments, or the hub network.

Run **Phase 5 - Spoke EC2** manually from the Actions tab on `main`. Select
`apply` or `destroy` and provide the existing spoke VPC ID and a private subnet
ID. The workflow assumes the spoke role
`arn:aws:iam::434097521299:role/testingdummy`. Its OIDC trust policy must allow
this GitHub repository. The role also needs permissions to manage the EC2,
security group, IAM role/profile, and this root's Terraform state and lock
file.

The instance type is fixed to `t3.micro`. This is a small, commonly free-tier
eligible type, but AWS billing eligibility depends on the account, offer, and
usage. The instance has no public IP. Its security group allows outbound HTTPS
only to the spoke VPC CIDR, so Session Manager uses the SSM interface
endpoints already deployed in the spoke.

This root does not add routes or allow inbound traffic. Use Session Manager to
access the instance; manage connectivity and route-table experiments
separately. Destroy the instance from this workflow when finished.
