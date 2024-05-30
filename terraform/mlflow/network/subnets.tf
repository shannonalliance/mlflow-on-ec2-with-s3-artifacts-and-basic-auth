resource "aws_subnet" "mlflow_ec2_subnet" {
  vpc_id            = aws_vpc.mlflow_vpc.id
  cidr_block        = "10.0.0.0/25"
  availability_zone = var.mlflow_ec2_subnet_az

  tags = {
    Name    = "mlflow_ec2_subnet"
    Purpose = "mlfow_for_teams_demo"
  }
}

resource "aws_subnet" "mlflow_load_balancer_subnet" {
  vpc_id            = aws_vpc.mlflow_vpc.id
  cidr_block        = "10.0.0.128/25"
  availability_zone = var.mlflow_load_balancer_subnet_az

  tags = {
    Name        = "mlflow_load_balancer_subnet"
    CostPurpose = var.cost_purpose_tag_value
  }
}
