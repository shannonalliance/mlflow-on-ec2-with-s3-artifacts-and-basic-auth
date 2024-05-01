resource "aws_internet_gateway" "mlflow_internet_gateway" {
    vpc_id = aws_vpc.mlflow_vpc.id
    
    tags = {
        Name = "mlflow_internet_gateway"
        Purpose = "mlfow_for_teams_demo"
    }
}
