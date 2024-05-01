terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.46.0"
        }
        
        null = {
            source = "hashicorp/null"
            version = "~> 3.2.2"
        }
    }
}

provider "aws" {
    profile = var.aws_profile
    region  = var.aws_region
}
