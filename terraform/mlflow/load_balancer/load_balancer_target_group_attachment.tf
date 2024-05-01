resource "aws_lb_target_group_attachment" "mlflow_load_balancer_target_group_attachment" {
    target_group_arn = aws_lb_target_group.mlflow_load_balancer_target_group.arn
    target_id = var.mlflow_instance_id
    port = 8080
}
