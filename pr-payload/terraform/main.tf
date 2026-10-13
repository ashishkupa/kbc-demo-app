# UC7: deliberately misconfigured IaC for PR feedback. NEVER APPLY THIS.
terraform {
  required_providers { aws = { source = "hashicorp/aws" } }
}

resource "aws_s3_bucket" "payments_data" {
  bucket = "kbc-demo-payments-data-do-not-apply"
  tags   = { team = "payments", env = "demo" }
}

resource "aws_s3_bucket_public_access_block" "payments_data" {
  bucket                  = aws_s3_bucket.payments_data.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_security_group" "open_ssh" {
  name        = "kbc-demo-open-ssh"
  description = "SSH open to the world"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_policy" "wildcard" {
  name = "kbc-demo-wildcard"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Effect = "Allow", Action = "*", Resource = "*" }]
  })
}

resource "aws_lambda_function" "webhook" {
  function_name = "kbc-demo-webhook"
  runtime       = "python3.8"
  handler       = "app.handler"
  role          = "arn:aws:iam::123456789012:role/placeholder"
  filename      = "placeholder.zip"
}
