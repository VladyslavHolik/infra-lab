terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  cloud {
    organization = "infra-lab-org"

    workspaces {
      name = "infra-lab"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "rsa-public-key-lab2" {
  public_key = var.rsa_public_key
}

resource "aws_security_group" "security-group-lab2" {
  name = "security-group-lab2"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "aws-instance-lab2" {
  ami             = var.aws_ami
  instance_type   = var.aws_instance_type
  key_name        = aws_key_pair.rsa-public-key-lab2.key_name
  security_groups = [aws_security_group.security-group-lab2.name]
  user_data       = <<-EOF
    #! /bin/bash
    sudo apt-get update
    sudo apt-get install ca-certificates curl -y
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo docker run -d --restart always -p 80:80  --name nginx vladyslavholik/nginx-server:latest
    sudo docker run -d --restart always --name watchtower -v /var/run/docker.sock:/var/run/docker.sock -e WATCHTOWER_POLL_INTERVAL=60 containrrr/watchtower
    EOF

  tags = {
    Project = "Infra labs"
  }

}
