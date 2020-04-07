provider "aws" {
    region                      = "us-east-2"
}

terraform {
    backend "s3" {
        bucket = "hmcn-terraform-state"
        key    = "terraform/terraform.tfstate"
        region = "us-east-2"
    }
    required_version = "0.12.24"
}
