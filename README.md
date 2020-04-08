# AWS Boilerplate
## Work in Progress
This collection of customizable boilerplate files is intended to ease the setup and configuration of some common cloud deployments.

## Requirements and Installation
* Ensure the latest version of Terraform, tfenv, and AWS CLI are installed.
* Ensure you have credentials with admin privileges stored in your `~/.aws/credentials` file.
* You will need an S3 bucket to use are your Terraform backend. Cloudformation auto-configuration of the backend in S3 is planned.

## Current Features
The current version has support for the following configurations:
* VPC with public and private subnets.
* High availability EC2 configuration with a customizable launch template and autoscaling group.
* Customizable ELB in the public subnet.

## Usage
* Initialize Terraform in the directory of the template you want to deploy. `terraform init`
* Before planning or applying, create a workspace with a name that indicates the purpose of the environment and the region it will be hosted in, e.g. `terraform workspace new sandbox-us-east-2`
* Change any default values in the `vars.tf` file to correspond to your desired configuration. You can change the organization name, service name, default subnets, and more.
* Apply into a sandbox account to test your configuration values before deploying to your primary account. Ensure there are no conflicts or overlap with any existing resources.
 