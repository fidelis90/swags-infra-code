variable "aws_region" {
  default     = "us-west-2"
  description = "Default AWS Region"
}

variable "kubernetics_version" {
  type    = string
  default = "1.21"
  description = "Kubernetics Region"
}

variable "cluster_name" {
  default     = "bha-eks"
  description = "EKS cluster name for BHA"
}

variable "disk_size" {
  default     = 30
  description = "EBS disk size"
}

variable "disk_type" {
  default     = "gp3"
  description = "EBS disk size"
}

variable "bha_private_subnets" {
  default = ["subnet-d0958998","subnet-8f38c5f6","subnet-006d8894171bc5c89"]
}



variable "bha_private_subnets_us-west-2a" {
  default = ["subnet-d0958998"]
}

variable "bha_private_subnets_us-west-2b" {
  default = ["subnet-8f38c5f6"]
}

variable "bha_private_subnets_us-west-2c" {
  default = ["subnet-006d8894171bc5c89"]
}

variable "bha_public_subnets" {
  default = ["subnet-6f978b27","subnet-3a3ec343","subnet-00ab95797dd12075e"]
}

variable "vpc_id" {
  default = "vpc-9765c4f2"
}

variable "keypair" {
  default     = "bfountain-EC2-instance-keypair"
  description = "bf-dev ec2 keypair "
}

variable "instance_type" {
  default     = "t3.medium"
  description = "Instance type"
}

variable "enable_monitoring" {
  default     = true
  description = "Enable monitoring"
}

variable "ng-us-west-2a" {
  default     = "workers-us-west-2a"
  description = "node group in us-west-2a"
}

variable "ng-us-west-2b" {
  default     = "workers-us-west-2b"
  description = "node group in us-west-2b"
}

variable "ng-us-west-2c" {
  default     = "workers-us-west-2c"
  description = "node group in us-west-2c"
}

variable "bf-dev-es-host" {
  default     = "vpc-bf-search-dev-z4yqkibdw2vocukypguslhga4m.us-west-2.es.amazonaws.com"
  description = "Elastic search in bf-dev"
}

variable "bf-dev-es-port" {
  default     = 443
  description = "Elastic search PORT in bf-dev"
}

variable "logstash_prefix" {
  default     = "bha-eks-fluentbit"
  description = "Elastic search index name bf-dev"
}

variable "bha-eks-logging-ns" {
  default     = "bha-eks-logging"
  description = "Elastic search in bf-dev"
}

# Global var file.
variable "default_tags" {
 type = map
 description = "Default Tags for BHA env"
 default = {
   "terraform" = true
 }
}