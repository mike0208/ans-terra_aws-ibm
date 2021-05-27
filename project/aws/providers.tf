#------------ AWS
#-------------aws/providers.tf

terraform {
  required_version = "v0.15.1"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.region
}