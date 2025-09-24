Ireland_cidr = "10.10.0.0/16"

# Ireland_cidr = {
#   "prod" = "10.10.0.0/16"
#   "dev"  = "172.16.0.0/16"
# }

subnets = ["10.10.0.0/24", "10.10.1.0/24"]

# public_subnet_ireland_cidr="10.10.0.0/24"
# private_subnet_ireland_cidr="10.10.1.0/24"
# Paris_cidr="10.20.0.0/16"

tags = {
  "env"         = "dev"
  "owner"       = "lcalvo"
  "project"     = "terraform-2025"
  "IAC"         = "terraform"
  "IAC_Version" = "1.13.0"
  "project"     = "cerberus"
  "region"      = "Ireland"
}

sg_ingress_cidr = "79.116.176.136/32"

ec2_spec = {
  "ami"           = "ami-09b024e886d7bbe74"
  "instance_type" = "t3.micro"
}

#enable_monitoring = true
enable_monitoring = 0

ingress_ports_list = [ 22, 80, 443 ]
