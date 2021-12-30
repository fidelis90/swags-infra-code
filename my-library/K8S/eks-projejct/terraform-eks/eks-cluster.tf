module "bha-eks" {
 source          = "terraform-aws-modules/eks/aws"
 cluster_name    = var.cluster_name
 cluster_version = var.kubernetics_version
 subnets         = concat(var.bha_private_subnets,var.bha_public_subnets)
 vpc_id          = var.vpc_id
 cluster_create_security_group = true
 
 cluster_iam_role_name = "${var.cluster_name}-cluster-role"
 workers_additional_policies = [aws_iam_policy.worker_ingress_policy.arn]
 wait_for_cluster_timeout = 900
 write_kubeconfig   = false
 manage_aws_auth    = false
 
 node_groups = {

   workers-us-west-2a = {
     desired_capacity  = 1
      max_capacity     = 1
      min_capacity     = 1
      workers_role_name = "${var.cluster_name}-${var.ng-us-west-2a}"
      subnets = var.bha_private_subnets_us-west-2a
      name             = var.ng-us-west-2a
      key_name         = var.keypair
      set_instance_types_on_lt = true
      worker_create_security_group = true
      launch_template_id      = aws_launch_template.bha-eks-workers.id
      launch_template_version = aws_launch_template.bha-eks-workers.default_version
   }
   
   workers-us-west-2b = {
     desired_capacity  = 1
      max_capacity     = 1
      min_capacity     = 1
      workers_role_name = "${var.cluster_name}-${var.ng-us-west-2b}"
      subnets = var.bha_private_subnets_us-west-2b
      name             = var.ng-us-west-2b
      key_name         = var.keypair
      set_instance_types_on_lt = true
      worker_create_security_group = true
      launch_template_id      = aws_launch_template.bha-eks-workers.id
      launch_template_version = aws_launch_template.bha-eks-workers.default_version
   }

   workers-us-west-2c = {
     desired_capacity  = 1
      max_capacity     = 1
      min_capacity     = 1
      workers_role_name = "${var.cluster_name}-${var.ng-us-west-2c}"
      subnets = var.bha_private_subnets_us-west-2c
      name             = var.ng-us-west-2c
      key_name         = var.keypair
      set_instance_types_on_lt = true
      worker_create_security_group = true
      launch_template_id      = aws_launch_template.bha-eks-workers.id
      launch_template_version = aws_launch_template.bha-eks-workers.default_version
   }
 
 }
}