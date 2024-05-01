resource "aws_dynamodb_table" "defect-detector-terraform_state" {
    name = var.dynamodb_state_lock_name
    hash_key = "LockID"
    billing_mode = "PAY_PER_REQUEST"

    attribute {
        name = "LockID"
        type = "S"
    }

      deletion_protection_enabled = true

    server_side_encryption {
        enabled = true
        kms_key_arn = aws_kms_key.mlflow_server_state_resources_key.arn
    }

    tags = {
        Name = "mlflow_state_lock"
        Purpose = "mlfow_for_teams_demo"
    }
}
