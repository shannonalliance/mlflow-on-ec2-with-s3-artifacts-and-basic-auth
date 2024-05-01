# ML Flow for Teams

This repository will help users launch an MLFlow Server for Collaborative ML Management

## Set the environment variables

- In the repository root directory, create a `.env` file.
- Copy and paste the `.env.template` file contents into the `.env` file.
- Replace the placeholder values with the values you want to use.
- Export the environment variables.
    - Either `source` this file, or copy and paste the content in the terminal.

## Bootstrapping terraform state tracking

### Init terraform project

- In your terminal navigate to the `terraform/bootstrap` directory of the repository:

```
cd terraform/bootstrap
```

- Init the project:

```bash
terraform init
```

### Deploy the state tracking resources

- Plan the resources to check for errors:

```
terraform plan
```

- Deploy the resources:

```
terraform apply -auto-approve
```

### Setup remote backend

- In the `terraform/bootstrap` directory, create a `backend.tf` file.
- Copy and paste the `backend.tf.template` file contents from the `terraform/bootstrap` directory into the `backend.tf` file.
- Replace the placeholder values with your values, from the .env file
    - These cannot be passed as variables, so we must add the values here.
- Re-init the project and re-apply:

```
terraform init
terraform apply -auto-approve
```

## Deploying the mlflow server

### Setup remote backend

- In the `terraform/mlflow` directory, create a `backend.tf` file.
- Copy and paste the `backend.tf.template` file contents from the `terraform/mlflow` directory into the `backend.tf` file.
- Replace the placeholder values with your values, from the .env file.
    - The main difference between the two backend files is the key field.
    - It is crucial that you use the correct key for each backend or there will be state issues.

### Init terraform project

- Init the project
```bash
terraform init
```

### Using targeted deployments

We will be using `terraform apply -target=module.module_name -auto-approve` pattern throughout. This will throw warnings.

Ignore these warnings as we want to be able to apply each resource independently as a module.

This approach will allow us to `destroy` resources temporarily without destroying the entire configuration.

This will be useful if we want to temporarily `destroy` the `ec2` instance and only have it running when we need it.

### network

- Plan the network resources to check for errors:

```
terraform plan -target=module.network
```

- Deploy the network resources:

```
terraform apply -target=module.network -auto-approve
```

Take note of the `mlflow_ec2_eip_public_ip` output. We will use this later.

### s3_bucket

- Plan the s3_bucket resources to check for errors:

```bash
terraform plan -target=module.s3_bucket
```

- Deploy the s3_bucket resources:

```bash
terraform apply -target=module.s3_bucket -auto-approve
```

### iam

- Plan the iam resources to check for errors:

```bash
terraform plan -target=module.iam
```

- Deploy the iam resources:

```bash
terraform apply -target=module.iam -auto-approve
```

### ec2_storage

- Plan the ec2_storage resources to check for errors:

```bash
terraform plan -target=module.ec2_storage
```

- Deploy the ec2_storage resources:

```bash
terraform apply -target=module.ec2_storage -auto-approve
```

### ec2_instance

- Plan the ec2_instance resources to check for errors:

```bash
terraform plan -target=module.ec2_instance
```

- Deploy the ec2_instance resources:

```bash
terraform apply -target=module.ec2_instance -auto-approve
```

### mlflow_server

Before proceeding with this step, you will need to install ansible on your machine.

An alternative would be to `ssh` in to your running instance and run the instructions listed in the `terraform/mlflow/ansible/start_mlflow_server.yml` file manually.

In the code editor of your choice, lets make the following changes within the mlflow_server module:

- In the ansible folder, create a `hosts.ini` file.
- Copy and paste the `hosts.ini.template` file contents into the `hosts.ini` file.
- Replace `xx.xxx.xxx.xxx` with your `mlflow_ec2_eip_public_ip` that you took note of earlier.
- In the ansible folder, create a `start_mlflow_server.yml` file.
- Copy and paste the `start_mlflow_server.yml.template` file contents into the `start_mlflow_server.yml` file.
- Navigate to the `Create MLFlow auth configuration file` block.
- Replace `<some-secure-password>` value of the `admin_password` key to a suitable password.
    - This sets the default admin password of the server.
    - It is good practice not to use the system default (which is `password`)

```yaml
    - name: Create MLFlow auth configuration file
        ansible.builtin.copy:
            dest: /home/ec2-user/mount/custom_auth_config.ini
            content: |
                [mlflow]
                default_permission = READ
                database_uri = sqlite:///basic_auth.db
                admin_username = admin
                admin_password = <some-secure-password>
                authorization_function = mlflow.server.auth:authenticate_request_basic_auth
            owner: ec2-user
            group: ec2-user
            mode: '0644'
```

- Navigate to the `Activate virtual environment and start MLflow server` block.
- Replace `<mlflow_artifacts_bucket_name>` value for the `--default-artifact-root` and `--artifacts-destination` options.
    - Use the value you chose earlier for your `mlflow_artifacts_bucket_name` environment variable.
    - This tells mlflow where to store and retrieve its artifacts to/from.

```yml
    - name: Activate virtual environment and start MLflow server
        shell: |
            source /home/ec2-user/mount/.venv/bin/activate
            export MLFLOW_TRACKING_URI=http://127.0.0.1:8080
            export MLFLOW_AUTH_CONFIG_PATH=/home/ec2-user/mount/custom_auth_config.ini
            cd /home/ec2-user/mount
            mlflow server --backend-store-uri mlruns \
                    --default-artifact-root s3://<mlflow_artifacts_bucket_name> \
                    --artifacts-destination s3://<mlflow_artifacts_bucket_name> \
                    --host 0.0.0.0 \
                    --app-name basic-auth \
                    --serve-artifacts \
                    --port 8080 &
```

- Plan the mlflow_server resources to check for errors:

```bash
terraform plan -target=module.mlflow_server
```

- Deploy the mlflow_server resources:

```bash
terraform apply -target=module.mlflow_server -auto-approve
```

- When prompted, type `yes` for adding the server fingerprint.

### load_balancer [optional]

If you want to be able to interact with your server over https and use a custom domain/subdomain, then follow along the below instructions.

If you do not need this (and as a note, load balancer costs ~$17USD/month) then you can skip this section and utilize the elastic ip public ip.

In the code editor of your choice, lets make the following changes within the load_balancer module:

- In the load_balancer module folder, create a `acm_certificate.tf` and `route_53_records.tf` file.
- Copy and paste the `acm_certificate.tf.template` file contents into the `acm_certificate.tf` file.
- Replace `<your.domain.or.subdomain.here>` value of the `domain_name` key to a valid domain/subdomain.
    - This has to be a value that can be created within your `hosted zone` which is not already in use.
- Copy and paste the `route_53_records.tf.template` file contents into the `route_53_records.tf` file.
- Replace `<your.domain.or.subdomain.here>` value of the `name` key to a valid domain/subdomain.
    - Make this the same as the value that you added above to `acm_certificate.tf`.

- Plan the load_balancer resources to check for errors:

```bash
terraform plan -target=module.load_balancer
```

- Deploy the load_balancer resources:

```bash
terraform apply -target=module.load_balancer -auto-approve
```

## Working with the Python API

Now that our server is up and running (assuming the above steps executed successfully) we will want to start adding users and modifying permissions.

I have included some sample `python` scripts for carrying out basic tasks like creating and deleting users and updating passwords.

For a comprehensive overview of the python api for user management:
- Visit the [mlflow documentation to see a full list of actions](https://mlflow.org/docs/latest/auth/python-api.html).

To get up and running start a virtual environment and install the requirements.

Do this by navigating to the `python` directory in your terminal and executing the commands below:

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

To start using the python scripts included, you must export some additional environment variables.

Create a `.env` file in the `python` directory and copy the contents of the `.env.template` in the same directory in to it.

Adjust the values to match your configuration. The tracking uri for example can be either:

- The domain we setup via the load balancer (e.g. https://your.domain.com)
- The elastic ip address with port 8080 (e.g. http://xx.xxx.xxx.xxx:8080)

Export these environment variables by either sourcing the file or copy and pasting the `export` commands in to the terminal.

Assuming you could install the dependencies, try modify the python scripts to start making adjustments to your users.

With the virtual environment active and the scripts modified you can start running the scripts.

- `python update_user_password.py`: updates the specified users password.
- `python create_user.py`: creates the specified user and password.
- `python delete_user.py`: deletes the specified user.

## Cleannig Up

### Temporarily removing the EC2 intsance

Use the `destroy`
```
terraform destroy -target=module.ec2_instance -auto-approve
```

And re-deploy the instance again with:
```
terraform apply -target=module.ec2_instance -auto-approve
```

This can be useful if you want to make some changes to the EC2 instance.

Alternatively stop the instance temporarilywith the `aws` cli:

```
aws ec2 stop-instances --instance-ids instance_id
```

And restart the instance with:

```
aws ec2 start-instances --instance-ids instance_id
```

The `instance_id` should be replaced with the value that will get output after you have deployed the `mlflow_instance` module.

### Pernamently destroynig the infrastructure

To pernamently remove all resources, simply run the `destroy` command without the `-target` option.

```
terraform destroy
```

This cannot be undone, and you will need to re-configure the ip adddress in the `terraform/mlflow/mlflow_server/hosts.ini` when redeploying.
