#! /bin/bash
echo "User data configuration script is running"
amazon-linux-extras list | grep nginx
amazon-linux-extras install nginx1.12
echo "User data configuration script has finished"
## Back up existing config
#mv /etc/nginx /etc/nginx-backup
#
## Download the configuration from S3
#aws s3 cp s3://{my_bucket}/nginxconfig.io-example.com.zip /tmp
#
## Install new configuration
#unzip /tmp/nginxconfig.io-example.com.zip -d /etc/nginx
