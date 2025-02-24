terraform {
  required_providers {
    tfe = {
      version = "~> 0.56.0"
    }
  }
}

provider "tfe" {
  token = var.tfc_token
}