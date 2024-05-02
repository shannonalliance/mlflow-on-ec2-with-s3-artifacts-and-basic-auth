resource "aws_instance" "mlflow_instance" {
    ami = var.ec2_ami
    instance_type = var.ec2_instance_type
    subnet_id = var.mlflow_ec2_subnet_id
    vpc_security_group_ids = [var.mlflow_default_security_group_id]
    key_name = aws_key_pair.mlflow_key_pair.key_name
    iam_instance_profile = var.mlflow_instance_profile_for_artifacts_bucket_access_name

    user_data = <<-EOF
            #!/bin/bash
            # Wait for the disk to become available
            while [ ! -e /dev/sdf ]; do sleep 1; done

            # Format the volume (if necessary)
            mkfs.ext4 /dev/sdf
            
            # Create a mount point
            mkdir -p /home/ec2-user/mount

            # Mount the volume
            mount /dev/sdf /home/ec2-user/mount

            # Ensure it remounts on reboot by adding it to /etc/fstab
            echo '/dev/sdf /home/ec2-user/mount ext4 defaults,nofail 0 2' >> /etc/fstab
        EOF

    tags = {
        Name = "mlflow_instance"
        CostPurpose = var.cost_purpose_tag_value
    }
    
    lifecycle {
        create_before_destroy = true
    }
}
