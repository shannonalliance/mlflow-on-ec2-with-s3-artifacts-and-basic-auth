resource "aws_kms_key" "mlflow_artifacts_bucket_kms_key" {
    description = "This key is used to encrypt the mlflow artifacts S3 Bucket."
    deletion_window_in_days = 10
    enable_key_rotation = true

    tags = {
        Name = "mlflow_artifacts_bucket_kms_key"
        Purpose = "mlfow_for_teams_demo"
    }
}
