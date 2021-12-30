resource "kubernetes_service_account" "bha-eks-fluentd" {
  metadata {
    name = local.name
    namespace = kubernetes_namespace.bha-eks-fluentbit-ns.metadata.0.name
  }
}