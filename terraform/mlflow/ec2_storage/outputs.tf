output "mlflow_ec2_persistent_ebs_volume_id" {
    value = aws_ebs_volume.mlflow_ec2_persistent_ebs_volume.id
    description = "The allocation id of the EBS volume."
}
