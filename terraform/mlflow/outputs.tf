output "mlflow_ec2_eip_public_ip" {
    description = "This is the mlflow instance eip public ip."
    value       = module.network.mlflow_ec2_eip_public_ip
}

output "mlflow_instance_id" {
    description = "This is the mlflow instance eip public ip."
    value       = module.ec2_instance.mlflow_instance_id
}
