data "aws_iam_policy_document" "mlflow_vpc_endpoint_policy" {
  statement {
    actions   = ["*"]
    resources = ["*"]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

resource "aws_vpc_endpoint" "mlflow_vpc_endpoint" {
  vpc_id            = aws_vpc.mlflow_vpc.id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_default_route_table.mlflow_default_route_table.id]
  policy            = data.aws_iam_policy_document.mlflow_vpc_endpoint_policy.json
  tags = {
    Name        = "mlflow_vpc_endpoint"
    CostPurpose = var.cost_purpose_tag_value
  }
}
