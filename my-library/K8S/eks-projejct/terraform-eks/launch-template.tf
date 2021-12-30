resource "aws_launch_template" "bha-eks-workers" {

  name                   = "${var.cluster_name}-lt" 
  description            = "BHA EKS Managed Node Group custom LT for %s"
  update_default_version = true

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = var.disk_size
      volume_type           = var.disk_type
      delete_on_termination = true
    }
  }


  instance_type = var.instance_type

  monitoring {
    enabled = var.enable_monitoring
  }

  network_interfaces {
    associate_public_ip_address = false
    delete_on_termination       = true
    security_groups = [module.bha-eks.worker_security_group_id,aws_security_group.sg-bha-eks-ng.id]
  }


  key_name = var.keypair

  # Supplying custom tags to EKS instances is another use-case for LaunchTemplates
  tag_specifications {
    resource_type = "instance"

    tags = {
        "Name" = "${var.cluster_name}-worker"
    }
      
  }

  # Supplying custom tags to EKS instances root volumes is another use-case for LaunchTemplates. (doesnt add tags to dynamically provisioned volumes via PVC tho)
  tag_specifications {
    resource_type = "volume"
    tags = {
        "Name" = "${var.cluster_name}-worker"
    }
  }

  # Tag the LT itself
  tags = {
        "Name" = "${var.cluster_name}-lt"
    }

  lifecycle {
    create_before_destroy = true
  }
}