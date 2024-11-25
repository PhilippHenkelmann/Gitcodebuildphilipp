provider "aws" {
  region = "eu-central-1" # Fixed AWS region
  }

terraform {
  backend "s3" {
    bucket = "philipp-git-codebuild-terraform" # Fixed typo in 'bucket'
    key    = "terraform.tfstate"
    region = "eu-central-1" # Removed extra double quotes
 }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.16.0"

  name = "Philipp-VPC"
  cidr = "10.0.0.0/16"
  azs  = ["eu-central-1a"]

  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  public_subnet_tags = {
    Name = "Philipp-Public-Subnet"
  }

  private_subnet_tags = {
    Name = "Philipp-Private-Subnet"
  }

  tags = {
    Owner = "Philipp"
  }
}
