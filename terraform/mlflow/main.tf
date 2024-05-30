module "network" {
  source = "./network"

  aws_region                     = var.aws_region
  mlflow_ec2_subnet_az           = var.mlflow_ec2_subnet_az
  mlflow_load_balancer_subnet_az = var.mlflow_load_balancer_subnet_az
  cost_purpose_tag_value         = var.cost_purpose_tag_value
}

module "s3_bucket" {
  source = "./s3_bucket"

  mlflow_artifacts_bucket_name = var.mlflow_artifacts_bucket_name
  cost_purpose_tag_value       = var.cost_purpose_tag_value
}

module "iam" {
  source = "./iam"

  mlflow_artifacts_bucket_name = var.mlflow_artifacts_bucket_name
  cost_purpose_tag_value       = var.cost_purpose_tag_value
}

module "ec2_storage" {
  source = "./ec2_storage"

  mlflow_ec2_subnet_az                  = var.mlflow_ec2_subnet_az
  mlflow_ec2_persistent_ebs_volume_size = var.mlflow_ec2_persistent_ebs_volume_size
  cost_purpose_tag_value                = var.cost_purpose_tag_value
}

module "ec2_instance" {
  source = "./ec2_instance"

  mlflow_ec2_persistent_ebs_volume_id                      = module.ec2_storage.mlflow_ec2_persistent_ebs_volume_id
  ec2_instance_type                                        = var.ec2_instance_type
  ec2_ami                                                  = var.ec2_ami
  mlflow_ec2_subnet_id                                     = module.network.mlflow_ec2_subnet_id
  mlflow_default_security_group_id                         = module.network.mlflow_default_security_group_id
  mlflow_instance_profile_for_artifacts_bucket_access_name = module.iam.mlflow_instance_profile_for_artifacts_bucket_access_name
  mlflow_ec2_eip_id                                        = module.network.mlflow_ec2_eip_id
  public_key_path                                          = var.public_key_path
  cost_purpose_tag_value                                   = var.cost_purpose_tag_value
}

module "mlflow_server" {
  source = "./mlflow_server"

  private_key_path = var.private_key_path
}

module "load_balancer" {
  source         = "./load_balancer"
  hosted_zone_id = var.hosted_zone_id
}
