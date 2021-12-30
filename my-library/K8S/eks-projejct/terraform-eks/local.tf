locals {
  name = "bha-eks-fluentbit"

  labels = {
    k8s-app = "bha-eks-fluentbit"
    version = "v1"
    "kubernetes.io/cluster-service" = "true"
  }

  env_variables = {
    "ES_HOST" : var.bf-dev-es-host,
    "ES_PORT" : var.bf-dev-es-port,
    "AWS_REGION" : var.aws_region,
    "ES_LOGSTASH_PREFIX" : "bha-eks-fluentbit"
  }

}