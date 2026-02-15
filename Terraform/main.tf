provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "eman-terraform-backend"
    key    = "cloud-devops/terraform.tfstate"
    region = "us-east-1"
  }
}

module "network" {
  source = "./modules/network"
}

module "server" {
  source = "./modules/server"

  subnet_id         = module.network.public_subnet_id
  security_group_id = module.network.security_group_id
}

