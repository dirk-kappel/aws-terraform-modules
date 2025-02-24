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
      Application   = var.application
      Environment   = var.environment
      Cost_Center   = var.cost_center
      Managed_By    = var.managed_by
      Owner         = var.owner
      TFC_Project   = var.tfc_project
      TFC_Workspace = var.tfc_workspace
    }
  }
}