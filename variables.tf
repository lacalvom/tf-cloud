variable "Ireland_cidr" {
  description = "CIDR block for Ireland VPC"
  type        = string
  #type        = map(string)
}

variable "subnets" {
  description = "List of subnets"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR block for security group ingress"
  type        = string
}

variable "ec2_spec" {
  description = "EC2 instance parameters"
  type        = map(string)
}

variable "ingress_ports_list" {
  description = "List of ingress ports for security group"
  type        = list(number)
}

# variable "public_subnet_ireland_cidr" {
#     description = "CIDR block for the public subnet in Ireland"
#     type = string
# }

# variable "private_subnet_ireland_cidr" {
#     description = "CIDR block for the private subnet in Ireland"
#     type = string
# }

# variable "Paris_cidr" {
# }

