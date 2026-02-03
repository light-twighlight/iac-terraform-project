provider "aws" {
  region = "eu-central-1"
}

module "ec2" {
  source = "../../modules/ec2"

  env               = "dev"
  instance_type      = var.instance_type
  key_name           = var.key_name
  allowed_ssh_cidr   = var.allowed_ssh_cidr
  allowed_app_cidr   = var.allowed_app_cidr
}

