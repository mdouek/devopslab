
provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "/Users/mendel.d/.aws/credentials"
  profile                 = "mdouek-aws"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-devopsthehardway-mdouek"
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}