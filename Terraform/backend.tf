terraform {
  backend "s3" {
    bucket = "eman-terraform-backend"
    key    = "cloud-devops/terraform.tfstate"
    region = "us-east-1"
  }
}

