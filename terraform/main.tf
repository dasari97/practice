provider "aws" {
    region = "us-east-1"
}

terraform {
    backend  "s3" {
        bucket = "d1924"
        key = "Terraform/workspace"
        region  = "us-east-1"
    }
}

resource "aws_instance" "myinstance" {
    ami = "ami-0760b951ddb0c20c9"
    instance_type = "t2.micro"
    vpc_security_group_ids  = [aws_security_group.my-sg.id]

    tags = {
        Name = "myinstance"
    }
}

resource "aws_security_group" "my-sg" {
  name        = "terraform"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  }

    ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "ssh"
    cidr_blocks     = ["0.0.0.0/0"] 
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "terraform"
  }
}

variable "password" {
    default = null
}

resource "null_resource" "nginx" {

    triggers = {
        a = timestamp()
    }
provisioner "remote-exec" {
    connection  {
            host    = aws_instance.myinstance.id
            user = "centos"
            password   = var.password
        }
    inline = [
        "sudo yum install nginx -y"
    ]

    }
}

