terraform {
  backend "s3" {
    bucket         = "eman-terraform-backend"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

