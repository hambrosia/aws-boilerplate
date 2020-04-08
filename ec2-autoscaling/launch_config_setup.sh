#!/bin/bash
echo "User data configuration script is starting"

export INDEX=/usr/share/nginx/html/index.html
sudo amazon-linux-extras install nginx1 -y

TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`

echo "Instance ID:" $(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id) > ${INDEX}
echo "<br>Instance type:" $(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-type) >> ${INDEX}
echo "<br> Private IP:" $(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/local-ipv4) >> ${INDEX}
echo "<br> AMI ID:" $(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/ami-id) >> ${INDEX}
echo "<br> Availability Zone:" $(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/placement/availability-zone) >> ${INDEX}

service nginx start
echo "User data configuration script has finished"