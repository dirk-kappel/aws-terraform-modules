provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Managed_By = "terraform"
    }
  }
}
