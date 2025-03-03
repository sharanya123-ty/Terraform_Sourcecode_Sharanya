provider "aws" {
access_key = ""
secret_key = ""    
region = var.aws_region
}
variable "aws_region" {
description = "The AWS region of EC2 instance."
type = string
default = "us-east-2"
}
variable "instance_type" {
description = "The type of EC2 instance"
type = string
default = "t2.micro"
}
variable "tag_prefix" {
description = "Prefix to use for the Name tag of the EC2 instance."
type = string
default = "Myec2instance"
}
data "aws_ami" "latest-amazon" {
most_recent = true
owners = ["amazon"]
filter {
name = "name"
values = ["amzn2-ami-hvm-*-x86_64-gp2"]
}
filter {
name = "root-device-type"
values = ["ebs"]
}
filter {
name = "virtualization-type"
values = ["hvm"]
}
}
data "aws_vpc" "default_vpc" {
default = true
}
locals {
creation_date = formatdate("DD-MM-YYYY", timestamp())
common_tags = {
"Name" = "${var.tag_prefix}-EC2-${local.creation_date}"
"User" = "Myec2instance"
"Environment" = "Production"
"Team" = "DevOps"
"Created_On" = local.creation_date
}
}
resource "aws_instance" "example_instance" {
ami = data.aws_ami.latest-amazon.id
instance_type = var.instance_type
tags = local.common_tags
}
output "ami_id" {
description = "The ID of the AMI used for the EC2 instance."
value = data.aws_ami.latest-amazon.id
}
output "vpc_id" {
description = "The ID of the default VPC."
value = data.aws_vpc.default_vpc.id
}