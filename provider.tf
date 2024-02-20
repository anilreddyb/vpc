provider "aws" {
  region  = "us-east-1"
  profile = "reddy"

}
terraform {
  required_version = "~>1.2.1"
  #  required_version = ">= 1.2.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.32.0"
    }
  }
}