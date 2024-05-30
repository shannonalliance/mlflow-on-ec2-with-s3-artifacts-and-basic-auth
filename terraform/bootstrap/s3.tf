resource "aws_s3_bucket" "mlflow_state_bucket" {
  bucket = var.state_bucket_name

  tags = {
    Name    = "mlflow_state_bucket"
    Purpose = "mlfow_for_teams_demo"
  }
}
