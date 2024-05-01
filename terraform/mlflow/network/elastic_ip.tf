resource "aws_eip" "mlflow_ec2_eip" {
    domain   = "vpc"
    
    tags = {
        Name = "mlflow_ec2_eip"
        Purpose = "mlfow_for_teams_demo"
    }
}
