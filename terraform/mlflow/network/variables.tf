variable "aws_region" {
    description = "The AWS Region where the infrastructure will be deployed."
    type = string
}

variable "mlflow_ec2_subnet_az" {
    description = "The availability zone to use for subnet 1, where the EC2 instance will reside."
    type = string
}

variable "mlflow_load_balancer_subnet_az" {
    description = "The availability zone to use for mlflow_load_balancer_subnet, required for the application load balancer."
    type = string
}

variable "cost_purpose_tag_value"{
    description = "Value to be assigned to the 'CostPurpose' tag across resources."
}
