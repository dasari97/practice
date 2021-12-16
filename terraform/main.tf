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

resource "null_resource" "nginx" {

    triggers = {
        a = timestamp()
    }
provisioner "remote-exec" {
    connection = {
            host    = aws_instance.myinstance.ip
            user = centos
            password    = vars.password
        }
    inline = [
        "sudo yum install nginx -y"
    ]

    }
}