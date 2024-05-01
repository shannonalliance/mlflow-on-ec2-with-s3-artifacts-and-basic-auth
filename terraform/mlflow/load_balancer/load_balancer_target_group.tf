resource "aws_lb_target_group" "mlflow_load_balancer_target_group" {
    name = "mlflow-lb-target-group"
    port = 8080
    protocol = "HTTP"
    vpc_id = var.mlflow_vpc_id
}
