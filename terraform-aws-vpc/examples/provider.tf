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
      Application   = var.application
      Cost_Center   = local.cost_center
      Managed_By    = "terraform"
      Environment   = var.environment
      Owner         = var.owner
      TFC_Project   = var.tfc_project
      TFC_Workspace = local.tfc_workspace
    }
  }
}