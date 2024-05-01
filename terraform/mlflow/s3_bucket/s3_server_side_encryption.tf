resource "aws_s3_bucket_server_side_encryption_configuration" "mlflow_artifacts_bucket_server_side_encryption" {
    bucket = aws_s3_bucket.mlflow_artifacts_bucket.id
    
    rule {
        apply_server_side_encryption_by_default {
            kms_master_key_id = aws_kms_key.mlflow_artifacts_bucket_kms_key.arn
            sse_algorithm     = "aws:kms"
        }
    }
}
