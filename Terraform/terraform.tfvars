aws_region = "eu-central-1"

vpc_cidr = "192.0.0.0/16"
public_subnet_cidr = "192.0.1.0/24"
private_subnet_cidr = "192.0.2.0/24"

availability_zone = "eu-central-1a"

ami_id = "ami-07eef52105e8a2059"
instance_type = "t2.micro"
key_name = "terraform_ec2_key"

security_group_ingress = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

security_group_egress = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]