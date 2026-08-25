terraform {
  backend "s3" {
    bucket         = "rsat-tf-state-2026"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
