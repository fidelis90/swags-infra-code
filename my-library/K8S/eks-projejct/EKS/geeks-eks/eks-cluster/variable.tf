variable "cluster_name" {
  default = "swags-eks-cluster"
}

variable "aws_region" {
  default = "us-west-2"
}

variable "cluster_version" {
  default = "1.21"
}

variable "ebs_volume" {
  default = 20
}

variable "instance_type" {
  default = "t2.small"
}

variable "keypair" {
  default = "swags-eks-key"
}

variable "enable_monitoring" {
  default = true
}

variable "aws_s3_readonly_policy" {
  default = ""
}

variable "aws_ssm_access_policy" {
  default = ""
}

variable "profile" {
  default = "holyswaggerapp"
}

variable "ingress_namespace" {
  default = "kube-system"
}

variable "map_users" {
  description = "Add the jenkins user to the aws-auth configmap"
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn-of-jenkins-user"
      username = "username of jenkins"
      groups   = ["system:masters"]
    }
  ]
}

variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      rolearn  = "arn:aws:iam::66666666666:role/role1"
      username = "role1"
      groups   = ["system:masters"]
    },
  ]
}
