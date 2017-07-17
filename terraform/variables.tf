variable "region" {
  default = "ap-southeast-2"
}

variable "tf_state_bucket" {
  description = "Name of terraform state S3 bucket."
  default     = "auscors-terraform-state-dev"
}

variable "tf_state_table" {
  description = "Name of terraform state lock DDB table."
  default     = "auscors-terraform-state-dev"
}

variable "environment" {
  description = "Deployment environment. Suffixes most created objects."
  default     = "dev"
}

variable "application" {
  description = "Application name. Used as webapp S3 bucket name, suffixed by the deployment environment name."
  default     = "auscors-sitelogs"
}

variable "owner" {
  description = "Application owner."
  default     = "Geodesy Operations"
}

variable "sns_arn" {
  description = "ARN of SNS topic which converter Lambda is invoked by."
  default     = "arn:aws:sns:ap-southeast-2:094928090547:DevGeodesy-SiteLogReceived-EYB2P4K966EE"
}