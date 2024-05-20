Copy code
# Deploy Lambda Function

This repository contains the infrastructure as code(Terraform) and the Lambda function code for a service that transforms HTML templates into PDFs and stores them in an S3 bucket.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Environment Variables](#environment-variables)
- [Workflow](#workflow)
- [Lambda Function](#lambda-function)
- [Setup Instructions](#setup-instructions)

## Overview

The Lambda function receives a payload containing `age` and `name` fields, uses this data to render an HTML template into a PDF, and saves the generated PDF in an S3 bucket.

## Architecture

1. **S3 Buckets**:
   - `html-to-pdf-remote-state`: Stores the Terraform state.
   - `html-to-pdf-application`: Stores the generated PDF files.

2. **Lambda Function**:
   - Receives JSON input with `age` and `name`.
   - Uses Jinja2 to render an HTML template.
   - Converts the HTML to PDF using `wkhtmltopdf`.
   - Stores the PDF in the `html-to-pdf-application` bucket.

## Environment Variables

Set the following environment variables:

- `REGION`: AWS region (e.g., `us-east-1`)
- `NAME_BUCKET_TERRAFORM`: Name of the S3 bucket for Terraform state (e.g., `html-to-pdf-remote-state`)
- `NAME_BUCKET_APP`: Name of the S3 bucket for the application (e.g., `html-to-pdf-application`)
- `AWS_ACCESS_KEY_ID`: AWS access key ID
- `AWS_SECRET_ACCESS_KEY`: AWS secret access key

## Workflow

This repository uses GitHub Actions to automate deployment processes. The workflows defined are:

- **Read YAML File**: Reads a configuration YAML file to determine if the infrastructure should be destroyed or created.
- **Destroy**: Destroys the infrastructure if specified.
- **Create Buckets**: Creates the necessary S3 buckets if they do not exist.
- **Build**: Prepares the Lambda function and dependencies, packages them, and uploads to S3.
- **Deploy**: Applies Terraform configuration to deploy the infrastructure.