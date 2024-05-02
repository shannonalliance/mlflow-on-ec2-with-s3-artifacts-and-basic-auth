variable "mlflow_artifacts_bucket_name" {
    description = "The name of the bucket used for storing artifacts for the MLFlow server."
    type = string
}

variable "cost_purpose_tag_value"{
    description = "Value to be assigned to the 'Purpose' tag across resources for cost monitoring purposes."
}
