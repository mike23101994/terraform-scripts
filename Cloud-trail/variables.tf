variable "project" {
  default     = "Nile-Project"
  }

variable "environment" {
  default     = "Dev"
}

variable "region" {
  default     = "us-west-2"
}

variable "create_s3_bucket" {
  default     = "true"
}

variable "s3_bucket_name" {
    default = "nile-cloudtrail-acesslog"
}

variable "enable_s3_bucket_expiration" {
  default     = "false"
}

variable "s3_bucket_days_to_expiration" {
  default     = "90"
}

variable "enable_s3_bucket_transition" {
  default     = "true"
}

variable "s3_bucket_days_to_transition" {
  default     = "90"
}

variable "s3_bucket_transition_storage_class" {
  default     = "ONEZONE_IA"
}

variable "enable_logging" {
  default     = "true"
}

variable "include_global_service_events" {
  default     = "true"
}

variable "is_multi_region_trail" {
  default     = "false"
}

variable "enable_log_file_validation" {
  default     = "false"
}

variable "is_organization_trail" {
  default     = "false"
}

variable "s3_key_prefix" {
  default     = "nile-cloudtrail-acesslog/cloudtraillogs"
}
