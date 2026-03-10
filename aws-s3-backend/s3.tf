resource "aws_s3_bucket" "terra" {
  bucket = "dourado-tf-bucket"
}

resource "aws_s3_bucket_versioning" "state" {
  bucket = aws_s3_bucket.terra.id
  versioning_configuration {
    status = "Enabled"
  }
}

