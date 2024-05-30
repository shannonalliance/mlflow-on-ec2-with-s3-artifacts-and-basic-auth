resource "aws_volume_attachment" "mlflow_extra_storage_attachment" {
  device_name = "/dev/sdf"
  volume_id   = var.mlflow_ec2_persistent_ebs_volume_id
  instance_id = aws_instance.mlflow_instance.id

  skip_destroy = true

}
