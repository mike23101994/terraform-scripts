
# data "aws_caller_identity" "current" {
# }


# resource "aws_launch_configuration" "as_conf" {

#   count           = local.if_autoscaling_enabled  || local.if_autoscale_and_eip_and_ebs  || local.if_autoscale_and_eip  || local.if_autoscale_and_ebs ? 1 : 0
#   # name            = "Nile-luanch-conf"
#   name            = var.aws_autoscaling_launc_config_name
#   #name_prefix    = var.aws_launch_configuration_name_prefix
#   image_id        = aws_ami_from_instance.ami[0].id
#   instance_type   = element(module.ec2_mod_for_autoscale[0].ec2_instance_type, 0)

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# ## Create an AMI out of the ec2 instance created

# resource "aws_ami_from_instance" "ami" {
#   count              =  var.autoscaling ? 1:0
#   name               = "Nile-EC2-autoscale"
#   source_instance_id = element(module.ec2_mod_for_autoscale[0].ec2_instance_id,0)
# }

# ## Provide launch permission to create aws ami from existing instance 

# # resource "aws_ami_launch_permission" "example" {
# #   image_id   = aws_ami_from_instance.ami[0].id
# #   account_id = data.aws_caller_identity.current.account_id
# #   depends_on = [aws_ami_from_instance.ami]
# # }

# ## Used for autoscaling groups ##
 
# resource "aws_autoscaling_group" "niledemo" {

#   count                =  var.autoscaling ? 1:0
#   name                 = var.aws_autoscaling_group_name
#   # name                = "Nile-ASG"
#   launch_configuration = aws_launch_configuration.as_conf[0].name
#   vpc_zone_identifier  = [var.subnet_id]
#   min_size             = var.aws_autoscaling_group_minsize
#   max_size             = var.aws_autoscaling_group_maxsize

#   lifecycle {
#     create_before_destroy = true
#   }
# }



# # resource "aws_autoscaling_attachment" "asg_attachment_bar" {
# #   autoscaling_group_name = aws_autoscaling_group.niledemo.id
# #   elb                    = aws_elb.bar.id
# # }


# # Create a new ALB Target Group attachment
# resource "aws_autoscaling_attachment" "asg_attachment_bar" {
#   count = var.autoscaling ? 1 : 0
#   autoscaling_group_name = aws_autoscaling_group.niledemo[0].id
#   alb_target_group_arn   = var.alb_arn
# }

# module "ec2_mod_for_autoscale" {
#   count = var.autoscaling ? 1 : 0
#   source =  "./module_ec2"
# }