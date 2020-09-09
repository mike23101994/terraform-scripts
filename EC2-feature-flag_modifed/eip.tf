# resource "aws_eip" "nile_eip" {

#   count                     = local.if_eip_enabled || local.if_autoscale_and_eip_and_ebs || local.if_autoscale_and_eip || local.if_ebs_and_eip ? 1 : 0
#   instance                  = element(module.ec2_mod_for_eip[0].ec2_instance_id,count.index)
#   vpc                       = true
# #   network_interface         = aws_network_interface.test.id
# #   associate_with_private_ip = var.EIP_Associated_Private_IP
# #   public_ipv4_pool          = var.Public_IPV4_Pool
# #   customer_owned_ipv4_pool  = var.Customer_Owned_IPV4_Pool

#   tags = {
#     Name = "Demo EIP"
#   }
# }

# ## Provides an AWS EIP Association as a top level resource, to associate and disassociate Elastic IPs from AWS Instances and Network Interfaces ##

# resource "aws_eip_association" "nile_eip_association" {
#   count                 = var.eip_enabled ? 1: 0
#   instance_id            = element(module.ec2_mod_for_eip[0].ec2_instance_id,count.index)
#   allocation_id         = aws_eip.nile_eip[0].id
#   allow_reassociation   = var.Allow_Reassociation
# #   network_interface_id  = aws_network_interface.test.id
# #   private_ip_address    = var.EIP_Associated_Private_IP
# }


# module "ec2_mod_for_eip" {
#   count = var.eip_enabled ? 1 : 0
#   source =  "./module_ec2"
# }