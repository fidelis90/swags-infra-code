terraform {
  backend "s3" {
    bucket  = "bfountain-terraform-state"
    key     = "bha-eks.tfstate"
    region  = "us-west-2"
    profile = "bf-dev"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "bf-dev"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}