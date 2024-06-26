locals {
  vpc_cidr           = "172.16.0.0/16"
  vpc_public_subnets = ["172.16.3.0/24", "172.16.4.0/24", "172.16.5.0/24"]
}

module "lbr-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = "user-data-testing"
  cidr = local.vpc_cidr

  azs            = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  public_subnets = local.vpc_public_subnets

}



module "ubuntu-tailscale-client" {
  source         = "../../"
  auth_key       = var.tailscale_auth_key
  enable_ssh     = true
  hostname       = "example-client"
  advertise_tags = ["tag:client"]
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_security_group" "main" {
  vpc_id      = module.lbr-vpc.vpc_id
  description = "Tailscale required traffic"

  ingress {
    from_port   = 41641
    to_port     = 41641
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Tailscale UDP port"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
}

# resource "aws_key_pair" "main" {
#   key_name   = "user-data-tailscale-ubuntu"
#   public_key = file("~/.ssh/id_rsa.pub")
# }

resource "aws_instance" "web" {
  #checkov:skip=CKV2_AWS_41:Testing instance
  #checkov:skip=CKV_AWS_8:Testing instance
  #checkov:skip=CKV_AWS_126:Testing instance
  #checkov:skip=CKV_AWS_88:Testing instance
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t3.micro"
  subnet_id       = module.lbr-vpc.public_subnets[0]
  security_groups = [aws_security_group.main.id]

  #key_name = aws_key_pair.main.key_name


  ebs_optimized = true

  user_data_base64            = module.ubuntu-tailscale-client.rendered
  associate_public_ip_address = true

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name = "user-data-tailscale-ubuntu"
  }
}
