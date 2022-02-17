output "cluster_endpoint" {
  description = "Endpoint for the EKS Control plane"
  value       = module.eks.cluster_endpoint
}

output "region" {
  description = "Region where the EKS Cluster is deployed"
  value       = var.aws_region
}

