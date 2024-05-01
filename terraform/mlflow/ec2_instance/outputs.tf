output "mlflow_instance_id" {
    description = "The ID of the MLFlow instance"
    value       = aws_instance.mlflow_instance.id
}
