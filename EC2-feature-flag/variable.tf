variable "profile" {
	default = "default"
}

variable "region" {
	default = "us-east-1"
}

variable "vpc_id"{
	default = "vpc-4ebd4d33"
}


## For EC2-Fleet

variable "fleet_enabled" {
  type = bool
  default = false
}

## For AutoScaling:

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = "subnet-8854f7a9"
}

variable "subnet_ids" {
  description = "A list of VPC Subnet IDs to launch in"
  type        = list(string)
  default     = ["subnet-23a9372d","subnet-8854f7a9","subnet-c8779ff9","subnet-c9c165af","subnet-de69c881","subnet-ec91e5a1"]
}

variable "aws_autoscaling_group_name" {
  default = "terraform-lc-example-"
}

variable "aws_autoscaling_launc_config_name" {
  default = "Nile autoscale"
}

variable "aws_autoscaling_group_maxsize" {
  default = 3
}

variable "aws_autoscaling_group_minsize" {
  default = 1
}

variable "aws_launch_configuration_name_prefix" {
  default = "terraform-"
}

variable "lifecycle_create_before_destroy" {
  default = true
}

variable "autoscaling" {
    type = bool
    default = true
}


## For EBS snapshot:

variable "vol_ids" {
  # type = list
  default = ["vol-085978c738e0a3722","vol-03a4f2a4302ffe061"]
}

variable "ebs_snapshot" {
    type = bool
    default = false
}

variable "snapshot_description" {
  default = "aws-ebs-snapshot"
}

variable "timeouts_create" {
  default = 10
}

variable "timeouts_update" {
  default = 10
}

variable "timeouts_delete" {
  default = 10
}


variable "snapshot_region" {
  default = "us-east-2"
}

variable "snapshot_encrypted" {
  default = false
}

variable "tag_name_snap_copy" {
  default = "demo_ebs_volume_snap_copy"
}

variable "tag_name_snap" {
  default = "demo_ebs_volume_snap"
}

## For EIP and Association

variable "eip_enabled" {
    type = bool
    default = false
}

variable "EIP_Associated_Private_IP" {
  default = "10.0.0.12"
}

variable "Public_IPV4_Pool" {
  default = "ipv4pool-ec2-012345"
}

variable "Customer_Owned_IPV4_Pool" {
  default = "10.1.0.0/26"
}

variable "Allow_Reassociation" {
  default = true
}



