provider "aws" {
  profile = var.profile
  region = var.region
}


module "ec2_module" {
  # enable = true
  count = ! var.fleet_enabled && ! var.eip_enabled && ! var.ebs_snapshot &&!  var.autoscaling? 1 : 0
  source = "./module_ec2"
}

module "ec2_fleet_module" {
  count = var.fleet_enabled ? 1 : 0
  source = "./module-ec2fleet"
}

locals{
  
  if_autoscaling_enabled = var.autoscaling && ! var.eip_enabled && ! var.ebs_snapshot ? true : false
  if_ebs_enabled = var.ebs_snapshot && ! var.eip_enabled && ! var.autoscaling ? true : false
  if_eip_enabled = var.eip_enabled && ! var.ebs_snapshot && ! var.autoscaling ? true : false
  if_autoscale_and_eip_and_ebs = var.autoscaling && var.ebs_snapshot && var.eip_enabled ? true : false
  if_autoscale_and_eip = var.autoscaling && var.eip_enabled && ! var.ebs_snapshot ? true : false
  if_autoscale_and_ebs = var.autoscaling && var.ebs_snapshot && ! var.eip_enabled ? true : false
  if_ebs_and_eip = var.ebs_snapshot && var.eip_enabled && ! var.autoscaling ? true : false  
}
