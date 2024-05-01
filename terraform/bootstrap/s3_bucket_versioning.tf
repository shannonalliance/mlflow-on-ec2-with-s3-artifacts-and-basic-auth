resource "aws_s3_bucket_versioning" "mlflow_state_bucket_versioning" {
    bucket = aws_s3_bucket.mlflow_state_bucket.id
    
    versioning_configuration {
        status = "Enabled"
    }
}
