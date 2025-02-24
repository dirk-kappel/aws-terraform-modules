terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  default_tags {
    tags = {
      Application = var.application
      Cost_Center = var.cost_center
      Created_By  = var.created_by
      Environment = var.environment
      Owner       = var.owner
    }
  }
}