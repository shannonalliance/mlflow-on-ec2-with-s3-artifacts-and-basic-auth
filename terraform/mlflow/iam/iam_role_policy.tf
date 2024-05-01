resource "aws_iam_role_policy" "mlflow_iam_role_policy_for_artifacts_bucket" {
    name = "mlflow_iam_role_policy_for_artifacts_bucket"
    role = aws_iam_role.mlflow_iam_role_for_artifacts_bucket_access.id

    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = [
                    "s3:*"
                ],
                Effect = "Allow",
                Resource = [
                    "arn:aws:s3:::${var.mlflow_artifacts_bucket_name}",
                    "arn:aws:s3:::${var.mlflow_artifacts_bucket_name}/*"
                ]
            }
        ]
    })
}
