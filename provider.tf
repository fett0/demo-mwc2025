# AWS PROVIDER CONFIGURATION

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      Company     = "VyOS Inc"
      Project     = "VyOS-MWC-2025"
      Environment = "MWC"
      ManagedBy   = "Terraform"
    }
  }
}