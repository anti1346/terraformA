terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.25.0"
    }
  }
}

provider "aws" {
  # Configuration options
  shared_credentials_file = "~/.aws/credentials"
  region  = "us-east-1"
  profile = "terraformA"
}
