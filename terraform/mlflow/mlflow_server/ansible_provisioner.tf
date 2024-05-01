resource "null_resource" "ansible_provisioner" {

    provisioner "local-exec" {
        command = "ansible-playbook --private-key=${var.private_key_path} -i ${path.module}/ansible/hosts.ini ${path.module}/ansible/start_mlflow_server.yml"
    }
}
