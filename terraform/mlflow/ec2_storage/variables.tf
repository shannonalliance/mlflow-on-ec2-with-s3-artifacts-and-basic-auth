variable "mlflow_ec2_subnet_az" {
    description = "The availability zone to use for subnet 1, where the EC2 instance will reside."
    type = string
}

variable "mlflow_ec2_persistent_ebs_volume_size" {
    description = "The amount of storage in GiB to allocated the externally mounted EBS volume."
    type = string
}

variable "cost_purpose_tag_value"{
    description = "Value to be assigned to the 'CostPurpose' tag across resources."
}
