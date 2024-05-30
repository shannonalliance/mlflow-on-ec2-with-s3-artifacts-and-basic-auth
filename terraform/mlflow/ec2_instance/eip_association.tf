resource "aws_eip_association" "mlflow_instance_eip_association" {
  instance_id   = aws_instance.mlflow_instance.id
  allocation_id = var.mlflow_ec2_eip_id
}
