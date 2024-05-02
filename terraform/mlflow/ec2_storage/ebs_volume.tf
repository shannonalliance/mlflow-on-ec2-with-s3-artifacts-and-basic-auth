resource "aws_ebs_volume" "mlflow_ec2_persistent_ebs_volume" {
    availability_zone = var.mlflow_ec2_subnet_az
    size              = var.mlflow_ec2_persistent_ebs_volume_size
    type              = "gp2"
    tags = {
        Name = "mlflow_ec2_persistent_ebs_volume"
        CostPurpose = var.cost_purpose_tag_value
    }
}
