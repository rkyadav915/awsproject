provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "AWS Production Platform"
      Environment = var.environment
      Owner       = "Krishna"
      ManagedBy   = "Terraform"
    }
  }
}