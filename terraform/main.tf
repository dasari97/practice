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
    wait_for_fulfillment   = true

    tags = {
        Name = "myinstance"
    }
}

resource "aws_security_group" "my-sg" {
  name        = "terraform"
  description = "Allow TLS inbound traffic"
  vpc_id = "vpc-046a61acc4b3c52bb"

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    self             = false
    security_groups  = []
  }

    ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    self             = false
    security_groups  = []
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
    connection {
      type     = "ssh"
      user     = centos
      password = var.password
      host     = aws_instance.myinstance.id
    }
    
    inline = [
      "sudo yum install python3-pip -y",
      "sudo pip3 install pip --upgrade",
      "sudo pip3 install ansible==4.1.0",
    ]
  }
}

