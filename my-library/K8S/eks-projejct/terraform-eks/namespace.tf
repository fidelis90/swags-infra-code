resource "kubernetes_namespace" "bha-eks-fluentbit-ns" {
  metadata {
    name = var.bha-eks-logging-ns
  }
}