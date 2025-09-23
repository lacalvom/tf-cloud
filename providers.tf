terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=6.7.0, <6.11.0, !=6.7.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
  required_version = "~> 1.13.0"
}

provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = var.tags
  }
}

# provider "aws" {
#     alias  = "paris"
#     region = "eu-west-3"
# }