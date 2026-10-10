terraform {
  backend "s3" {
    bucket       = "harish-gaddam-bucket123"
    key          = "spoke1/terraform.tfstate"
    region       = "ap-south-1"
    encrypt      = true
    use_lockfile = true
  }
}  