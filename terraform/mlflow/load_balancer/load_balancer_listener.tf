resource "aws_lb_listener" "mlflow_load_balancer_listener" {
  load_balancer_arn = aws_lb.mlflow_load_balancer.arn
  port = "443"
  protocol = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-2016-08"
  certificate_arn = aws_acm_certificate.mlflow_acm_cert.arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.mlflow_load_balancer_target_group.arn
  }
}
