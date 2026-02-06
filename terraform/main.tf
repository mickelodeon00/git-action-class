terraform {

  backend "s3" {
    bucket = "techbleat-class-cicd-state-bucket"
    key = "envs/dev/week10/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "java_node" {
  ami = "ami-096f46d460613bed4"
  instance_type = "t3.micro"
  key_name = "mickey" 
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    "Name" = "java Node"
  }
}

resource "aws_instance" "nginx_node" {
  ami = "ami-096f46d460613bed4"
  instance_type = "t3.micro"
  key_name = "mickey" 
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = {
    "Name" = "Nginx Node"
  }
}






