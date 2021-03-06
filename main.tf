terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-06eecef118bbf9259"
  subnet_id     = "subnet-0e14272060e96bcdc"
  instance_type = "t3.micro"

  tags = {
    Name = var.instance_name
  }
}

# variables
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Batman"
}

#Outputs
output "instance_name" {
  description = "The tag name for this instance"
  value       = var.instance_name
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
