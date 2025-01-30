variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

variable "availability_zone" {
  description = "AWS Availability Zone"
  type        = string
  default     = "us-east-2c"
}

variable "prefix" {
  type        = string
  description = "Prefix for the resource names and Name tags"
  default     = "MWC"
}

variable "key_pair" {
  description = "SSH key pair name"
  type        = string
  default     = "MWC2025"
}

variable "vpc_name" {
  description = "Name for VPC"
  default     = "vyos2025-vpc"
}

variable "public_subnet_name" {
  description = "The name of the public subnet"
  type        = string
  default     = "pub-subnet"
}

variable "private_subnet_01_name" {
  description = "The name of the private subnet 01"
  type        = string
  default     = "priv-subnet-01"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_01_cidr" {
  description = "CIDR block for private subnet 01"
  type        = string
  default     = "10.0.11.0/24"
}

variable "dns_servers" {
  description = "DNS servers"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}

variable "vyos_pub_nic_ip_address" {
  description = "VyOS Instance Public address"
  type        = string
  default     = "10.0.1.11"
}

variable "vyos_priv_nic_01_ip_address" {
  description = "VyOS Instance Private NIC 01 address"
  type        = string
  default     = "10.0.11.11"
}

variable "web_priv_nic_01_ip_address" {
  description = "Trex Instance Private NIC 01 address"
  type        = string
  default     = "10.0.11.21"
}
variable "vyos_instance_type" {
  description = "The type of the VyOS Instance"
  type        = string
  default     = "t3.medium"
}

variable "vyos_instance_name" {
  type    = string
  default = "VyOS"
}
variable "web_instance_name" {
  type    = string
  default = "Web"
}

variable "igw_name" {
  type    = string
  default = "igw"
}

variable "vyos_eip_name" {
  type    = string
  default = "vyos"

}

variable "public_rtb_name" {
  type    = string
  default = "public-rtb"

}

variable "private_rtb_01_name" {
  type    = string
  default = "private-rtb-01"
}

variable "public_sg_name" {
  type    = string
  default = "public-sg"
}

variable "private_sg_name" {
  type    = string
  default = "private-sg"
}
