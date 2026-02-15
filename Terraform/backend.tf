terraform {
  backend "s3" {
    bucket = "eman-terraform-backend"
    key    = "global/terraform.tfstate"
    region = "us-east-1"
  }
}

