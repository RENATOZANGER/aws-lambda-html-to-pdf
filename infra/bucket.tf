resource "aws_s3_bucket" "lambda_bucket" {
  bucket = "my-lambda-bucket-zip-htmltopdf"
}

resource "aws_s3_bucket_object" "lambda_object" {
  bucket = aws_s3_bucket.lambda_bucket.id
  key    = "lambda_function.zip"
  source = "../lambda_function.zip"
  etag   = filemd5("../lambda_function.zip")
}

resource "aws_s3_bucket" "htmltopdf" {
  bucket = "my-lambda-bucket-htmltopdf"
}