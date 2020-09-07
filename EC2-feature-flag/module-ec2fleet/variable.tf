variable "profile" {
	default = "default"
}

variable "region" {
	default = "us-east-1"
}

variable "template_name" {
  default = "aws-launch-template"
}

variable "launch_template_description" {
  default = "Template for ec2 instances"
}

variable "block_device_name" {
  default = "/dev/sda1"
}


variable "ebs_size" {
  default = 1
}

variable "capacity_reservation_preference" {
  description = "Indicates the instance's Capacity Reservation preferences. Can be open or none. (Default none)."
  default = "none"
}

variable "core_count" {
  default = 4
}

variable "threads_per_core" {
  default = 2
}

variable "credit_specification_cpu_credits" {
  default = "standard"
}

variable "launch_template_disable_api_termination" {
  default = true
}

variable "launch_template_ebs_optimized" {
  default = true
}

variable "elastic_gpu_specifications_type" {
  default = "test"
}

variable "elastic_inference_accelerator_type" {
  default = "eia1.medium"
}

variable "instance_profile_arn" {
  default = ""
}

variable "iam_instance_profile_name" {
  default = "test"
}

variable "image_id" {
  default = "ami-0c94855ba95c71c99"
}

variable "instance_initiated_shutdown_behavior" {
  default = "terminate"
}

variable "market_type" {
  default = "spot"
}

variable "block_duration_minutes" {
  default = 60
}

variable "instance_interruption_behavior" {
  default = "terminate"
}

variable "max_price" {
  default = "20"
}

variable "spot_instance_type" {
  default = "one-time"
}

variable "valid_until" {
  default = "31-12-2020"
}

variable "instance_type" {
  default = "m1.small"
}

variable "kernel_id" {
  default = "test"
}

variable "launch_template_key_name" {
  default = "test"
}

variable "license_configuration_arn" {
  default = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
}

variable "http_endpoint" {
  default = "enabled"
}

variable "http_tokens" {
  default = "required"
}

variable "http_put_response_hop_limit" {
  default = 1
}

variable "monitoring_enabled" {
  default = true
}

variable "placement_availability_zone" {
  default = "us-east-1c"
}
variable "ram_disk_id" {
  default = "test"
}
variable "vpc_security_group_ids" {
  default = ""
}
variable "resource_type" {
  default = "instance"
}
variable "tag_specifications_tagname" {
  default = "test"
}
variable "launch_template_user_data" {
  default = ""
}

variable "hibernation_options" {
  default = true
}

variable "tag_name" {
	default = "Nile_EC2_SG2"
}

variable "vpc_id"{
	default = "vpc-4ebd4d33"
}

variable "launch_template_associate_public_ip_address" {
  default = true
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = "subnet-de69c881"
}

variable "subnet_ids" {
  description = "A list of VPC Subnet IDs to launch in"
  type        = list(string)
  default     = ["subnet-23a9372d","subnet-8854f7a9","subnet-c8779ff9","subnet-c9c165af","subnet-de69c881","subnet-ec91e5a1"]
}

variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  type        = list(map(string))
  default     = []
}

variable "network_delete_on_termination" {
  type = bool
  default = true
}

variable "instance_platform" {
  default = "Linux/UNIX"
} 

variable "instance_count" {
  default = 1
}  

variable "excess_capacity_termination_policy" {
	default = "termination"
}
variable "allocation_strategy" {
	default = "lowestPrice"
}

variable "replace_unhealthy_instances" {
	default = true
}

variable "spot_options_instance_interruption_behavior" {
	default = "stop"
}
variable "instance_pools_to_use_count" {
	default = 1
}

variable "terminate_instances" {
	default = false
}

variable "terminate_instances_with_expiration" {
	default = false
}

variable "fleet_type" {
	default = "maintain"
}
variable "tag_ec2_fleet" {
	default = "ec2_fleet"
}

variable "total_target_capacity" {
  default = 2
}

variable "default_target_capacity_type" {
  default = "spot"
}
