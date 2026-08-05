resource "aws_s3_bucket" "terraform_demo" {
  bucket = "rkyadav915-tf-demo-001"

  tags = {
    Name        = "Terraform Demo Bucket"
    Environment = "Learning"
    Owner       = "Krishna"
  }
}