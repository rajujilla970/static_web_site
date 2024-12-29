terraform {
  required_version = "~> 1.9.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
provider "aws" {
  region  = ap-south-1
}
  backend "s3" {
    bucket         = "my-ews-baket1432"
    region         = "ap-south-1"
    key            = "terraform/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    encrypt        = true
  }
}


