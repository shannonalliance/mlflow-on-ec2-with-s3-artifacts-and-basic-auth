resource "aws_default_route_table" "mlflow_default_route_table" {
    default_route_table_id = aws_vpc.mlflow_vpc.default_route_table_id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.mlflow_internet_gateway.id
    }
    
    tags = {
        Name = "mlflow_default_route_table"
        CostPurpose = var.cost_purpose_tag_value
    }
}
