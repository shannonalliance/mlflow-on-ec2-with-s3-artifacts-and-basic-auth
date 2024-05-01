resource "aws_iam_role" "mlflow_iam_role_for_artifacts_bucket_access" {
    name = "mlflow_iam_role_for_artifacts_bucket_access"

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
                Effect = "Allow"
                Sid    = ""
            },
        ]
    })
    
    tags = {
        Name = "mlflow_iam_role_for_artifacts_bucket_access"
        Purpose = "mlfow_for_teams_demo"
    }
}
