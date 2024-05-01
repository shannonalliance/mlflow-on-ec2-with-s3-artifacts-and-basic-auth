resource "aws_lb" "mlflow_load_balancer" {
    name = "mlflow-load-balancer"
    internal = false
    load_balancer_type = "application"
    security_groups = [var.mlflow_default_security_group_id]
    subnets = [var.mlflow_ec2_subnet_id, var.mlflow_load_balancer_subnet_id]
    
    tags = {
        Name = "mlflow_load_balancer"
        Purpose = "mlfow_for_teams_demo"
    }
}
