terraform {
  backend "s3" {
    bucket = "terraform-state-devopsthehardway-mdouek"
    key    = "ecr-terraform.tfstate"
    region = "us-west-2"
    shared_credentials_file = "/Users/mendel.d/.aws/credentials"
    profile                 = "mdouek-aws"
    
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "/Users/mendel.d/.aws/credentials"
  profile                 = "mdouek-aws"
}

resource "aws_ecr_repository" "devopsthehardway-ecr-repo" {
  name                 = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}