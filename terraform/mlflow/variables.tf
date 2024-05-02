variable "aws_profile" {
    description = "The AWS Profile used to build the infrastructure."
    type = string
}

variable "aws_region" {
    description = "The AWS Region where the infrastructure will be deployed."
    type = string
}

variable "ec2_instance_type" {
    description = "The instance type used for the EC2 instance."
    type = string
}

variable "ec2_ami" {
    description = "The AMI used for the EC2 instance."
    type = string
}
variable "public_key_path" {
    description = "The path to the public key for ssh-ing in to the EC2 instance."
    type = string
}

variable "private_key_path"{
    description="The path to the private key for ssh-ing in to the EC2 instance."
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

variable "hosted_zone_id" {
    description = "The hosted zone where A records will be added for https traffic via the load balancer."
    type = string
}

variable "mlflow_artifacts_bucket_name" {
    description = "The name of the bucket used for storing artifacts for the MLFlow server."
    type = string
}

variable "mlflow_ec2_persistent_ebs_volume_size" {
    description = "The amount of storage in GiB to allocated the externally mounted EBS volume."
    type = string
}

variable "cost_purpose_tag_value"{
    description = "Value to be assigned to the 'Purpose' tag across resources for cost monitoring purposes."
}
