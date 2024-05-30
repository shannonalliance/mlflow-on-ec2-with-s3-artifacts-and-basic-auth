resource "aws_iam_instance_profile" "mlflow_instance_profile_for_artifacts_bucket_access" {
  name = "mlflow_instance_profile_for_artifacts_bucket_access"
  role = aws_iam_role.mlflow_iam_role_for_artifacts_bucket_access.name

  tags = {
    Name        = "mlflow_instance_profile_for_artifacts_bucket_access"
    CostPurpose = var.cost_purpose_tag_value
  }
}
