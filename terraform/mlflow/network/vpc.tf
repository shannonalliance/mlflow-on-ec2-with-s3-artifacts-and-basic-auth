resource "aws_vpc" "mlflow_vpc" {
    cidr_block = "10.0.0.0/24"
    
    tags = {
        Name = "mlflow_vpc"
        CostPurpose = var.cost_purpose_tag_value
    }
}
