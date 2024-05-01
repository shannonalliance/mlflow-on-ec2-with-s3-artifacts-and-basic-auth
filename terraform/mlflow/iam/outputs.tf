output "mlflow_instance_profile_for_artifacts_bucket_access_name" {
    value = aws_iam_instance_profile.mlflow_instance_profile_for_artifacts_bucket_access.name
    description = "The name of the IAM instance profile which grants EC2 instances the necessary S3 access."
}
