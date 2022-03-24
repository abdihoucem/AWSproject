provider "aws" {
     region = "${var.region}"
     profile = "devops"
}

variable "region" {
    description = "Region Name"
    default = "us-east-2"
}

variable "aws_region" {
    description = "EC2 region for The VPC"
    default = "us-east-2"
}

variable "remote_cidr" {
    description = "CIDR from Remote Testing Source"
    default =   "172.31.0.0/16"
}

variable "vpc_cidr" {
    description = "CIDR for the VPC"
    default =   "10.0.0.0/16"
}

variable "public_subnet_2a_cidr" {
    description = "CIDR for public 2a Subnet"
    default =   "10.0.0.0/25"
}
variable "public_subnet_2b_cidr" {
    description = "CIDR for public 2b Subnet"
    default =   "10.0.0.128/25"
}



variable "key_path" {
    description = "SSH Public Key path"
    default = "C:/Users/abdih/.ssh/id_rsa.pub"
}

variable "asg_jenkins_slave_min"{
    description = "Auto scaling Minimum Size"
    default = "1"
}

variable "asg_jenkins_slave_max"{
    description = "Auto scaling Maximum Size"
    default = "2"
}

variable "asg_jenkins_slave_desired"{
    description = "Auto scaling Desired Size"
    default = "2"
}

variable "asg_jenkins_master_min"{
    description = "Auto scaling Minimum Size"
    default = "1"
}

variable "asg_jenkins_master_max"{
    description = "Auto scaling Maximum Size"
    default = "1"
}

variable "asg_jenkins_master_desired"{
    description = "Auto scaling Desired Size"
    default = "1"
}

variable "asg_git_min"{
    description = "Auto scaling Minimum Size"
    default = "1"
}

variable "asg_git_max"{
    description = "Auto scaling Maximum Size"
    default = "2"
}

variable "asg_git_desired"{
    description = "Auto scaling Desired Size"
    default = "1"
}

variable "data_volume_type" {
    description = "EBS Volume Type"
    default = "gp2"  
}

variable "data_volume_size" {
    description = "EBS volume Size"
    default = "50"
}

variable "root_block_device_size" {
    description = "Root EBS Volume Size"
    default = "50"
}

variable "gitlab_postgresql_password" {
    default = "supersecret"
}

variable "git_rds_multiAZ" {
    default = "false"
}

variable "availability_zones" {
  type = list
  default = ["us-east-2a","us-east-2b"]
}

variable "private_DB_subnet_2a_cidr" {
    description = "CIDR for the Private 2a Subnet"
    default = "10.0.2.0/25"  
}

variable "private_DB_subnet_2b_cidr" {
    description = "CIDR for the Private 2b Subnet"
    default = "10.0.2.128/25"  
}





