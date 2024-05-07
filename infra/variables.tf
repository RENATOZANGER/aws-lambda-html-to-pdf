variable "region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}

variable "lambda_name" {
  description = "lambda name"
  type        = string
  default     = "html-to-pdf"
}

variable "policy_lambda_name" {
  description = "policy lambda name"
  type        = string
  default     = "policy_lambda_name"
}

variable "role_lambda_name" {
  description = "role lambda name"
  type        = string
  default     = "lambda_role"
}

variable "NAME_BUCKET_APP" {
  description = "bucket name"
  type        = string
  default     = "html-to-pdf-application"
}

variable "python_version" {
  description = "bucket name"
  type        = string
  default     = "python3.11"
}
