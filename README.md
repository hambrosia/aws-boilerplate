# AWS Boilerplate
## Work in Progress
This collection of customizable boilerplate files is intended to ease the setup and configuration of some common cloud deployments.

## Requirements and Installation
* Ensure the latest version of Terraform, tfenv, and AWS CLI are installed.
* Ensure you have credentials with admin privileges stored in your `~/.aws/credentials` file.

## Current Features
The current version has support for the following configurations:
* Three-tier VPC with public, private, and database subnets across three availability zones.
* Customizable ELB in the public subnet.
* High availability EC2 configuration with a customizable launch template and autoscaling group in private subnet.
* RDS / Postgres in the database subnet.
* Security groups to control traffic between resources in public, private, and database subnets.

## Usage
* Confirm your default AWS region in `~/.aws/config`. This template uses `us-east-2` by default, but any region will work.
* Create your S3 backend using the Cloudformation template `cloudformation/s3_backend.yaml`. Make sure to update your default organization name in the template. Then run the script to create your S3 backend bucket. First make the script executable: `chmod +x create_s3_backend.sh` then run the script: `./create_s3_backend.sh`. Confirm that your bucket was created in the AWS console and verify that the region matches your expected region.
* Update the bucket name in `terraform/main.tf` to match the name of the bucket you created during the Cloudformation steps previously. If you selected a region other than `us-east-2` make sure to update the region in the AWS provider and backend in `main.tf` as well. Unfortunately, no variable interpolation is allowed in the backend configuration so this must be done manually.
* Initialize Terraform in the directory of the template you want to deploy. `terraform init`
* Before planning or applying, create a workspace with a name that indicates the purpose of the environment and the region it will be hosted in, e.g. `terraform workspace new sandbox-us-east-2`
* Change any default values in the `vars.tf` file to correspond to your desired configuration. You can change the organization name, service name, default subnets, and more.
* `terraform apply` into a sandbox account to test your configuration values before deploying to your primary account. Ensure there are no conflicts or overlap with any existing resources in your primary account before you proceed to a production deployment.
 