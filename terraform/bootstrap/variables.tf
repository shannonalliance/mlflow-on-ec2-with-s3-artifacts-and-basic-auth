variable "aws_profile" {
    description = "The AWS Profile used to build the infrastructure."
    type = string
}

variable "aws_region" {
    description = "The AWS Region where the infrastructure will be deployed."
    type = string
}
variable "state_bucket_name" {
    description = "The name of the bucket used for storing the state of the infrastructure."
    type = string
}

variable "dynamodb_state_lock_table_name" {
    description = "The name of the dynamodb table used for locking the state of the infrastructure."
    type = string
}
