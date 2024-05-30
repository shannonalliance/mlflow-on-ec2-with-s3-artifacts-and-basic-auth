variable "mlflow_ec2_persistent_ebs_volume_id" {
  description = "The allocation id of the EBS volume."
  type        = string
}

variable "ec2_instance_type" {
  description = "The instance type used for the EC2 instance."
  type        = string
}

variable "ec2_ami" {
  description = "The AMI used for the EC2 instance."
  type        = string
}

variable "mlflow_ec2_subnet_id" {

}

variable "mlflow_default_security_group_id" {

}

variable "mlflow_instance_profile_for_artifacts_bucket_access_name" {

}

variable "mlflow_ec2_eip_id" {

}

variable "public_key_path" {
  description = "The path to the public key for ssh-ing in to the EC2 instance."
  type        = string
}

variable "cost_purpose_tag_value" {
  description = "Value to be assigned to the 'CostPurpose' tag across resources."
}
