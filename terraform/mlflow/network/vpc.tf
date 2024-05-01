resource "aws_vpc" "mlflow_vpc" {
    cidr_block = "10.0.0.0/24"
    
    tags = {
        Name = "mlflow_vpc"
        Purpose = "mlfow_for_teams_demo"
    }
}
