resource "aws_s3_bucket" "mlflow_artifacts_bucket" {
  bucket        = var.mlflow_artifacts_bucket_name
  force_destroy = true
  tags = {
    Name        = "mlflow_artifacts_bucket"
    CostPurpose = var.cost_purpose_tag_value
  }
}
