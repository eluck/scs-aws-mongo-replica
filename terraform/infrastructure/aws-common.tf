provider "aws" {
  region = "$SCSVAR_region"
  profile = "$SCSVAR_boto_profile"
}


resource "aws_security_group" "sec_group_outbound" {
  name = "sec-group-outbound"
  description = "Allow host to go to the internet"

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "sec_group_ssh" {
  name = "sec-group-ssh"
  description = "Open SSH access"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu*16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
