resource "aws_kms_key" "mlflow_server_state_resources_key" {
    description = "This key is used to encrypt our DynamoDB Lock Table and S3 Bucket"
    deletion_window_in_days = 10
    enable_key_rotation = true

    tags = {
        Name = "mlflow_state_resources_key"
        Purpose = "mlfow_for_teams_demo"
    }
}
