terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket       = "harish-gaddam-bucket123"
    key          = "phase5/spoke-ec2/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
