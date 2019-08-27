# Common
variable "tags" {
  description = ""
  type        = "map"
  default = {
    Name = "Test Image"
  }
}



# virutal machine information

variable "vm_type" {
  description = "Virtual Machine size."
  type        = "string"
  default     = "t2.medium"
}

variable "vm_image" {
  description = ""
  default     = "ami-0750ef05514ffde7e"
  type        = "string"
}

variable "user_data" {
  default = "New-NetFirewallRule -DisplayName \"Allow inbound TCP port 5985\" -Direction inbound -LocalPort 5985 -Protocol TCP -Action Allow"
  type    = "string"
}

# Network

variable "vm_public_ip_flag" {
  description = "Indicates if the vm will use a public ip (true or flase)"
  default     = "true"
  type        = "string"
}

variable "vnet_id" {
  default = "vpc-65817700"
  type    = "string"
}

variable "subnet_id" {
  default = "subnet-a473a4c1"
  type    = "string"
}

#Security

variable "security_group_name" {
  type    = "string"
  default = "image_test_sg"
}

variable "security_group_description" {
  default = "Default security group that allows inbound and outbound traffic from Test Image instance in the VPC"
  type    = "string"
}

variable "security_group_rules" {
  type = "list"
  default = [
    {
      name                     = "Internet Outbound Traffic"
      protocol                 = "-1"
      destination_address_list = "0.0.0.0/0"
      destionation_port_range  = "0"
      security_rule_direction  = "egress"
      source_address_list      = "0.0.0.0/0"
      source_port_range        = "0"
    },
    {
      name                     = "SSH"
      protocol                 = "TCP"
      destination_address_list = "0.0.0.0/0"
      destionation_port_range  = "22"
      security_rule_direction  = "ingress"
      source_address_list      = "0.0.0.0/0"
      source_port_range        = "22"
    },
    {
      name                     = "WinRM-HTTPS"
      protocol                 = "TCP"
      destination_address_list = "0.0.0.0/0"
      destionation_port_range  = "5986"
      security_rule_direction  = "ingress"
      source_address_list      = "0.0.0.0/0"
      source_port_range        = "5986"
    },
    {
      name                     = "inRM-HTTP"
      protocol                 = "TCP"
      destination_address_list = "0.0.0.0/0"
      destionation_port_range  = "5985"
      security_rule_direction  = "ingress"
      source_address_list      = "0.0.0.0/0"
      source_port_range        = "5985"
    }
  ]
}



variable "public_key_name" {
  type        = "string"
  default     = "image_test_key"
  description = ""
}

variable "public_key_file" {
  type        = "string"
  default     = "~/.ssh/id_rsa_test.pub"
  description = ""
}


