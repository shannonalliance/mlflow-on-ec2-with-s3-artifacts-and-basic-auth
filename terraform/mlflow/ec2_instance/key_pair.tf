resource "aws_key_pair" "mlflow_key_pair" {
    key_name   = "mlflow_key_pair"
    public_key = file(var.public_key_path)
}
