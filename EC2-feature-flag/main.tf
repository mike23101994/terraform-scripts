provider "aws" {
  profile = var.profile
  region = var.region
}


module "ec2_module" {
  # enable = true
  count = 0
  source = "./module_ec2"
}

module "ec2_fleet_module" {
  count = var.fleet_enabled ? 1 : 0
  source = "./module-ec2fleet"
}