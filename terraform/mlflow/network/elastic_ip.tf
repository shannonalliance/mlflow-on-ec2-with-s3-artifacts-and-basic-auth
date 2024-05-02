resource "aws_eip" "mlflow_ec2_eip" {
    domain   = "vpc"
    
    tags = {
        Name = "mlflow_ec2_eip"
        CostPurpose = var.cost_purpose_tag_value
    }
}
