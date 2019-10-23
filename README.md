# AWS Bootstrap

[![Build Status](https://travis-ci.com/celkins/aws-bootstrap.svg?branch=master)](https://travis-ci.com/celkins/aws-bootstrap)

CloudFormation templates for bootstrapping (my) AWS account(s).

## Usage

### IAM

Bootstrap IAM by creating a CloudFormation stack that manages the following resources:

- Group that allows self-management of user credentials and read-only account access for members using MFA devices
- Administrator group and role
- Developer group and role

This stack can be created via the console immediately after account creation (easy) or later with the CLI (hard, because it requires creating access keys for the root account [or creating some other adminstrator-ish role]):

```console
aws cloudformation create-stack                     \
    --stack-name <value>                            \
    --template-body file://./bootstrap-iam-cfn.yaml \
    --capabilities CAPABILITY_IAM
```

### Terraform

Bootstrap Terraform by creating a CloudFormation stack that manages the following resources:

- S3 bucket suitable for storing Terraform state files
- DynamoDB table suitable for storing Terraform state metadata

```console
aws cloudformation create-stack \
    --stack-name <value>        \
    --template-body file://./bootstrap-tf-cfn.yaml
```
