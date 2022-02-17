# data sources can be used to do something and then give you data 
# data sources will just provide you information 
# the code below will get the most recent ami that has the name prefix app-

# data "aws_ami" "app_ami" {
#   most_recent = true
#   filter {
#     name   = "name"
#     values = ["app-*"]
#   }
# }

data "aws_availability_zones" "available" {}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
