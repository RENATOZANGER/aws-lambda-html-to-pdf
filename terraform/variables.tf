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

variable "bucket_name" {
  description = "bucket name"
  type        = string
  default     = "lambda-html-to-pdf-remote-state"
}

variable "python_version" {
  description = "bucket name"
  type        = string
  default     = "python3.11"
}
