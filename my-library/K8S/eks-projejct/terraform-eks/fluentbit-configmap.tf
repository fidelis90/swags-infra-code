resource "kubernetes_config_map" "bha-eks-fluentbit" {
  metadata {
    name = local.name
    namespace = kubernetes_namespace.bha-eks-fluentbit-ns.metadata.0.name
    labels=local.labels
  }

  data = {
      "fluent-bit.conf" = <<EOF
[SERVICE]
    Flush         1
    Log_Level     info
    Daemon        off
    Parsers_File  parsers.conf
    HTTP_Server   On
    HTTP_Listen   0.0.0.0
    HTTP_Port     2020
    Parsers_File parsers.conf
[INPUT]
    Name              tail
    Tag               kube.*
    Path              /var/log/containers/*.log
    Parser            docker
    DB                /var/log/flb_kube.db
    Mem_Buf_Limit     50MB
    Skip_Long_Lines   On
    Refresh_Interval  10
[FILTER]
    Name                kubernetes
    Match               kube.*
    Kube_URL            https://4AE7E0CA77E134014F9BE7BC78B4F1A7.gr7.us-west-2.eks.amazonaws.com:443
    Kube_CA_File        /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
    Kube_Token_File     /var/run/secrets/kubernetes.io/serviceaccount/token
    Kube_Tag_Prefix     kube.var.log.containers.
    Merge_Log           On
    Merge_Log_Key       log_processed
    K8S-Logging.Parser  On
    K8S-Logging.Exclude Off
[OUTPUT]
    Name            es
    Match           *
    Host            ${var.bf-dev-es-host}
    Port            ${var.bf-dev-es-port}
    TLS             On
    AWS_Region      ${var.aws_region}
    Retry_Limit     6
    Logstash_Prefix ${var.logstash_prefix}
    Logstash_Format True
EOF

       "parsers.conf" = <<EOF
[PARSER]
    Name        docker
    Format      json
    Time_Key    time
    Time_Format %Y-%m-%dT%H:%M:%S.%L
    Time_Keep   On
[PARSER]
    Name        syslog
    Format      regex
    Regex       ^\<(?<pri>[0-9]+)\>(?<time>[^ ]* {1,2}[^ ]* [^ ]*) (?<host>[^ ]*) (?<ident>[a-zA-Z0-9_\/\.\-]*)(?:\[(?<pid>[0-9]+)\])?(?:[^\:]*\:)? *(?<message>.*)$
    Time_Key    time
    Time_Format %b %d %H:%M:%S
EOF
  }
}