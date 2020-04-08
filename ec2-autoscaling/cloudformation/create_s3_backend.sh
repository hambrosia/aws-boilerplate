#!/bin/bash

aws cloudformation create-stack --stack-name terraform-s3-state --template-body file://s3_backend.yaml
