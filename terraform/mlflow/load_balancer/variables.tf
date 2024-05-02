variable "mlflow_ec2_persistent_ebs_volume_id" {
    description = "The allocation id of the EBS volume."
    type = string
}

variable "hosted_zone_id" {
    description = "The hosted zone where A records will be added for https traffic via the load balancer."
    type = string
}

variable "mlflow_default_security_group_id" {
    
}

variable "mlflow_ec2_subnet_id" {
    
}

variable "mlflow_load_balancer_subnet_id" {
    
}

variable "mlflow_vpc_id" {
    
}

variable "mlflow_instance_id" {
    
}

variable "cost_purpose_tag_value"{
    description = "Value to be assigned to the 'Purpose' tag across resources for cost monitoring purposes."
}
