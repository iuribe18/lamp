variable "region" {
  type = string
  default = "us-east-1" # Northern Virginia
}

variable "vpc_cidr" {
  type        = string
  description = "vpc_cidr"
  default = "10.0.0.0/16"
}

variable "network_cidr" {
  type        = list(string)
  description = "CIDR Public Subnets"
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

/*variable "CIDR_Private" {
  type        = list(string)
  description = "CIDR Private Subnets"
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}*/

variable "az" {
  type        = list(string)
  description = "AWS Availability Zones"
  default = ["us-east-1a", "us-east-1b"] # us-east-1
  #default = ["us-west-2a", "us-west-2b"] # us-east-2
}

variable "network_name" {
  type        = list(string)
  description = "Names of Subnets"
  default = ["subnet_public", "subnet_private"]
}

/*variable "Subnet_Private" {
  type        = list(string)
  description = "Names of Subnets"
  default = ["Subnet_Private1", "Subnet_Private2"]
}*/

variable "route_table" {
  type        = list(string)
  description = "Names of Route Table"
  default = ["rt_public", "rt_private"]
}

variable "sg_ports" {
  type        = list(number)
  description = "List of Ingress Ports"
  default = [22, 80]
}

variable "sec_group" {
  type        = list(string)
  description = "Names od the Security Groups"
  default = ["sec_group_public", "sec_group_private"]
}

variable "ami" {
  type        = string
  description = "Type of AMI"
  #default = "ami-017fecd1353bcc96e" # AMI Ubuntu
  #default = "ami-0c65adc9a5c1b5d7c" # AMI Ubuntu 20.04, Oregon
  default = "ami-06aa3f7caf3a30282" # AMI Ubuntu 20.04, Northern Virginia
  #default = "ami-06e85d4c3149db26a" # AMI Amazon Linux
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance types"
  default = "t2.micro"
}

variable "EC2Names" {
  type        = list(string)
  description = "EC2 Instance Names"
  default = ["EC2_public", "EC2_Public2"]
}

variable "info_tags" {
  default     = { owner = "Ivancho", stack = "Test", email = "ivanuribegonzalez@gmail.com" }
  description = "Additional resource tags"
  type        = map(string)
}