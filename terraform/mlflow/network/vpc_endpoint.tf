resource "aws_vpc_endpoint" "mlflow_vpc_endpoint" {
    vpc_id            = aws_vpc.mlflow_vpc.id
    service_name      = "com.amazonaws.${var.aws_region}.s3"
    vpc_endpoint_type = "Gateway"

    route_table_ids = [aws_default_route_table.mlflow_default_route_table.id]

    policy = <<POLICY
{
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Principal": "*"
        }
    ]
}
POLICY
    
    tags = {
        Name = "mlflow_vpc_endpoint"
        Purpose = "mlfow_for_teams_demo"
    }
}
