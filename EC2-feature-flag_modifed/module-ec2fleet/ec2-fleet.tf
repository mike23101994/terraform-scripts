resource "aws_ec2_fleet" "example" {
  launch_template_config {
    launch_template_specification {
    #   launch_template_id = "lt-0bd6ecc75445e53cb"
      launch_template_id = aws_launch_template.launch-template.id
      # launch_template_id = data.aws_launch_template.default.id
      # version           = data.aws_launch_template.default.latest_version
      version            = aws_launch_template.launch-template.latest_version
    }
  }

  target_capacity_specification {
    default_target_capacity_type = var.default_target_capacity_type
    total_target_capacity        = var.total_target_capacity
  }

  excess_capacity_termination_policy = var.excess_capacity_termination_policy
  on_demand_options{
	allocation_strategy = var.allocation_strategy
  }
  
  replace_unhealthy_instances = var.replace_unhealthy_instances
  
  spot_options{
    allocation_strategy = var.allocation_strategy
    instance_interruption_behavior = var.spot_options_instance_interruption_behavior
    instance_pools_to_use_count = var.instance_pools_to_use_count
  }
   terminate_instances = var.terminate_instances
  
  terminate_instances_with_expiration = var.terminate_instances_with_expiration
  type = var.fleet_type
  
  tags = {
	  Name = var.tag_ec2_fleet
  }

}

data "aws_launch_template" "default" {
  name = "Nile-demo"
}