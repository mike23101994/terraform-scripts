#  provider "aws" {
#    profile = var.profile
#    region = var.region
# }

resource "aws_launch_template" "launch-template" {
  name = "Nile-ec2-fleet-template"

  block_device_mappings {
    device_name = var.block_device_name

    ebs {
      volume_size = var.ebs_size
    }
  }

  capacity_reservation_specification {
    capacity_reservation_preference = var.capacity_reservation_preference
  }

  # cpu_options {
  #   core_count       = var.core_count
  #   threads_per_core = var.threads_per_core
  # }

  credit_specification {
    cpu_credits = var.credit_specification_cpu_credits
  }

  disable_api_termination = var.launch_template_disable_api_termination

  ebs_optimized = var.launch_template_ebs_optimized


  elastic_gpu_specifications {
    type = var.elastic_gpu_specifications_type
  }

  elastic_inference_accelerator {
    type = var.elastic_inference_accelerator_type
  }

  iam_instance_profile {
    arn = aws_iam_instance_profile.iam_instance_profile.arn
    # name = aws_iam_instance_profile.iam_instance_profile.name
  }

  image_id = var.image_id

  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior

  # instance_market_options {
  #   market_type = var.market_type
  # }

  instance_type = var.instance_type

  # kernel_id = "test"

  key_name = "mainak-ec2"

  # license_specification {
  #   license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  # }

  metadata_options {
    http_endpoint               = var.http_endpoint
    http_tokens                 = var.http_tokens
    http_put_response_hop_limit = var.http_put_response_hop_limit
  }
  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = var.launch_template_associate_public_ip_address
  }

  placement {
    availability_zone =  var.placement_availability_zone
   
  }

  # ram_disk_id = "test"

  vpc_security_group_ids = [aws_security_group.sg.id]

  tag_specifications {
    resource_type = var.resource_type

    tags = {
      Name = var.tag_specifications_tagname
    }
  }

  # user_data = filebase64("${path.module}/example.sh")
}


resource "aws_iam_role" "test_role" {
  name = "ec2-fleet-role2"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}


resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "ec2-pro"
  role = aws_iam_role.test_role.name
}
