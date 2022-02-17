module "dev_cluster" {
  source       = "./eks-cluster"
  cluster_name = "dev-swags-cluster"
  profile      = "holyswaggerapp"
}

module "staging_cluster" {
  source       = "./eks-cluster"
  cluster_name = "staging-swags-cluster"
  profile      = ""
}

module "prod_cluster" {
  source       = "./eks-cluster"
  cluster_name = "prod-swags-cluster"
  profile      = ""
}
