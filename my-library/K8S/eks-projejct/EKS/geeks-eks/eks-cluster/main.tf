provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "aws" {
  region  = var.aws_region
  profile = var.profile
}


provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}
