resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "my-lambda-bucket-${random_id.bucket_suffix.hex}"
}

resource "aws_s3_bucket_object" "lambda_object" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key    = "lambda_function.zip"
  source = "../lambda/lambda_function.zip"
  etag   = filemd5("../lambda/lambda_function.zip")
}

resource "random_id" "bucket_suffix" {
  byte_length = 8
}

resource "aws_s3_bucket" "htmltopdf" {
  bucket = "my-lambda-bucket-htmltopdf"
}