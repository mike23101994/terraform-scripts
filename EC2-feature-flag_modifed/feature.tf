resource "aws_ebs_snapshot" "nile-ec2-snapshot" {

  count       = local.if_ebs_enabled  || local.if_autoscale_and_eip_and_ebs  || local.if_autoscale_and_ebs  || local.if_ebs_and_eip ? 1 : 0
  # volume_id   =  var.vol_ids[count.index]
  volume_id     = element(module.ec2_mod_for_features[0].ebs_volume_id[0], 0)
  description = var.snapshot_description

  tags = {
    Name = var.tag_name_snap
  }

  # timeouts{
  #   create            = var.timeouts_create
  #   delete            = var.timeouts_delete
  # }

  # depends_on = []
}

data "aws_caller_identity" "current" {
}


resource "aws_launch_configuration" "as_conf" {

  count           = local.if_autoscaling_enabled  || local.if_autoscale_and_eip_and_ebs  || local.if_autoscale_and_eip  || local.if_autoscale_and_ebs ? 1 : 0
  # name            = "Nile-luanch-conf"
  name            = var.aws_autoscaling_launc_config_name
  #name_prefix    = var.aws_launch_configuration_name_prefix
  image_id        = aws_ami_from_instance.ami[0].id
  instance_type   = element(module.ec2_mod_for_features[0].ec2_instance_type, 0)

  lifecycle {
    create_before_destroy = true
  }
}

## Create an AMI out of the ec2 instance created

resource "aws_ami_from_instance" "ami" {
  count              =  local.if_autoscaling_enabled  || local.if_autoscale_and_eip_and_ebs  || local.if_autoscale_and_eip  || local.if_autoscale_and_ebs ? 1 : 0
  name               = "Nile-EC2-autoscale"
  source_instance_id = element(module.ec2_mod_for_features[0].ec2_instance_id,0)
}

## Provide launch permission to create aws ami from existing instance 

# resource "aws_ami_launch_permission" "example" {
#   image_id   = aws_ami_from_instance.ami[0].id
#   account_id = data.aws_caller_identity.current.account_id
#   depends_on = [aws_ami_from_instance.ami]
# }

## Used for autoscaling groups ##
 
resource "aws_autoscaling_group" "niledemo" {

  count                =  local.if_autoscaling_enabled  || local.if_autoscale_and_eip_and_ebs  || local.if_autoscale_and_eip  || local.if_autoscale_and_ebs ? 1 : 0
  name                 = var.aws_autoscaling_group_name
  # name                = "Nile-ASG"
  launch_configuration = aws_launch_configuration.as_conf[0].name
  vpc_zone_identifier  = [var.subnet_id]
  min_size             = var.aws_autoscaling_group_minsize
  max_size             = var.aws_autoscaling_group_maxsize

  lifecycle {
    create_before_destroy = true
  }
}


# Create a new ALB Target Group attachment
resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  count = local.if_autoscaling_enabled  || local.if_autoscale_and_eip_and_ebs  || local.if_autoscale_and_eip  || local.if_autoscale_and_ebs ? 1 : 0
  autoscaling_group_name = aws_autoscaling_group.niledemo[0].id
  alb_target_group_arn   = var.alb_arn
}

resource "aws_eip" "nile_eip" {

  count                     = local.if_eip_enabled || local.if_autoscale_and_eip_and_ebs || local.if_autoscale_and_eip || local.if_ebs_and_eip ? 1 : 0
  instance                  = element(module.ec2_mod_for_features[0].ec2_instance_id,count.index)
  vpc                       = true
#   network_interface         = aws_network_interface.test.id
#   associate_with_private_ip = var.EIP_Associated_Private_IP
#   public_ipv4_pool          = var.Public_IPV4_Pool
#   customer_owned_ipv4_pool  = var.Customer_Owned_IPV4_Pool

  tags = {
    Name = "Demo EIP"
  }
}

## Provides an AWS EIP Association as a top level resource, to associate and disassociate Elastic IPs from AWS Instances and Network Interfaces ##

resource "aws_eip_association" "nile_eip_association" {
  count                     = local.if_eip_enabled || local.if_autoscale_and_eip_and_ebs || local.if_autoscale_and_eip || local.if_ebs_and_eip ? 1 : 0
  instance_id            = element(module.ec2_mod_for_features[0].ec2_instance_id,count.index)
  allocation_id         = aws_eip.nile_eip[0].id
  allow_reassociation   = var.Allow_Reassociation
#   network_interface_id  = aws_network_interface.test.id
#   private_ip_address    = var.EIP_Associated_Private_IP
}

module "ec2_mod_for_features" {
  count = var.autoscaling || var.ebs_snapshot || var.eip_enabled ? 1 : 0
  source =  "./module_ec2"
}