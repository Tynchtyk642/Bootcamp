provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "bootcamp-terraform.tfstate"
    key     = "Meerim/terraform.tfstate"
    encrypt = true
  }
}
