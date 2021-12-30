resource "aws_security_group" "sg-bha-eks-ng" {
  name        = "${var.cluster_name}-worker-sg"
  vpc_id      = var.vpc_id
  description = "Security Group for EKS Nodes for SSH access"
  tags = merge(var.default_tags, map("Name", "${var.cluster_name}-worker-sg"))

   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}