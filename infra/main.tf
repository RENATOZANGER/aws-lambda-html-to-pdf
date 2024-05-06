provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "lambda-html-to-pdf-remote-state"
    key    = "lambda-html-to-pdf/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_lambda_function" "my_lambda" {
  runtime       = var.python_version
  function_name = var.lambda_name
  handler       = "lambda_function.handler"
  role          = aws_iam_role.lambda_role.arn
  timeout       = 90

  source_code_hash = filebase64sha256("lambda_function.zip")

  s3_bucket = "my-lambda-bucket-zip-htmltopdf"
  s3_key    = "lambda_function.zip"

  layers = [aws_lambda_layer_version.wkhtmltopdf_layer.arn]
}

resource "aws_lambda_layer_version" "wkhtmltopdf_layer" {
  layer_name = "wkhtmltopdf-layer"
  s3_bucket  = "my-lambda-bucket-zip-htmltopdf"
  s3_key     = "wkhtmltopdf_layer.zip"

  compatible_runtimes = [var.python_version]
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.my_lambda.function_name}"
  retention_in_days = 1
  depends_on        = [aws_lambda_function.my_lambda]
}