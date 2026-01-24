terraform {

  backend "s3" {
    bucket = "techbleat-class-cicd-state-bucket"
    key = "envs/dev/terraform.tfstate"
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


resource "aws_instance" "web_node" {
  ami = "ami-096f46d460613bed4"
  instance_type = "t3.micro"
  tags = {
    "Name" = "Web Node"
  }
}


resource "aws_instance" "app_node" {
  ami = "ami-096f46d460613bed4"
  instance_type = "t3.micro"
  tags = {
    "Name" = "App Node"
  }
}


resource "aws_instance" "ansible_node" {
  ami = "ami-096f46d460613bed4"
  instance_type = "t3.micro"
  tags = {
    "Name" = "Ansible Node"
  }
}


