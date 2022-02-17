## This is the module that configures the eks cluster 
## Contains the following 
## - The EKS Cluster Version 
#    - The EKS Terraform module 
#    - Details about the worker nodes( Instance type, root volume disk type and the security groups for the worker nodes )

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "<18"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = concat(module.vpc.private_subnets, module.vpc.public_subnets)

  tags = {
    Environment = "development"
  }

  vpc_id = module.vpc.vpc_id

  cluster_endpoint_private_access = "true"
  cluster_endpoint_public_access  = "true"
  cluster_create_security_group   = true
  wait_for_cluster_timeout        = 900

  write_kubeconfig = false
  manage_aws_auth  = true

  workers_additional_policies = [aws_iam_policy.ingress_worker_policy.arn, var.aws_s3_readonly_policy, var.aws_ssm_access_policy]

  node_groups = {

    workers-1 = {
      name                         = "workers-1"
      desired_capacity             = 1
      min_capacity                 = 1
      max_capacity                 = 3
      subnets                      = module.vpc.private_subnets
      set_instance_types_on_lt     = true
      worker_create_security_group = true
      launch_template_id           = aws_launch_template.swags-eks-workers.id
      launch_template_version      = aws_launch_template.swags-eks-workers.default_version
      key_name                     = var.keypair
    }
  }

  # map_roles = var.map_roles
  # map_users = var.map_users

}


