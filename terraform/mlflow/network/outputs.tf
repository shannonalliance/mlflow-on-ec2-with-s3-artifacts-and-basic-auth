output "mlflow_ec2_eip_id" {
  value       = aws_eip.mlflow_ec2_eip.id
  description = "The allocation id of the EIP for mlflow_instance"
}

output "mlflow_ec2_eip_public_ip" {
  value       = aws_eip.mlflow_ec2_eip.public_ip
  description = "The Elastic IP address associated with the mlflow instance"
}

output "mlflow_vpc_id" {
  value       = aws_vpc.mlflow_vpc.id
  description = "The id of vpc"
}

output "mlflow_ec2_subnet_id" {
  value       = aws_subnet.mlflow_ec2_subnet.id
  description = "The id of mlflow_ec2_subnet"
}

output "mlflow_load_balancer_subnet_id" {
  value       = aws_subnet.mlflow_load_balancer_subnet.id
  description = "The id of mlflow_load_balancer_subnet"
}

output "mlflow_default_security_group_id" {
  value       = aws_default_security_group.mlflow_default_security_group.id
  description = "The id of default security group"
}
