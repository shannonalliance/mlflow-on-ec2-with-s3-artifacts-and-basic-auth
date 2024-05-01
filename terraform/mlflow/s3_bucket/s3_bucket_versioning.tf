resource "aws_s3_bucket_versioning" "mlflow_artifacts_bucket_versioning" {
    bucket = aws_s3_bucket.mlflow_artifacts_bucket.id
    
    versioning_configuration {
        status = "Enabled"
    }
}
