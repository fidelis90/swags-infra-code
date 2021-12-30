data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_eks_cluster" "cluster" {
  name = module.bha-eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.bha-eks.cluster_id
}

/*
 data "template_file" "launch_template_userdata" {
  template = file("user_data.sh.tpl")
  vars = {
    cluster_name        = var.cluster_name
    endpoint            = module.bha-eks.cluster_endpoint
    cluster_auth_base64 = module.bha-eks.cluster_certificate_authority_data
    bootstrap_extra_args = ""
    kubelet_extra_args   = ""
  }
}