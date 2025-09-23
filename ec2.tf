variable "instancias" {
  description = "Nombre de las instancias a crear"
  type        = list(string)
  default     = ["apache"]
}

resource "aws_instance" "public_instance" {
  for_each               = toset(var.instancias)
  ami                    = var.ec2_spec["ami"]
  instance_type          = var.ec2_spec["instance_type"]
  subnet_id              = aws_subnet.public_subnet_ireland.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")
  tags = {
    Name = "${each.value}-${local.sufix}"
  }
}

resource "aws_instance" "monitoring_instance" {
  count                  = var.enable_monitoring == 1 ? 1 : 0
  ami                    = var.ec2_spec["ami"]
  instance_type          = var.ec2_spec["instance_type"]
  subnet_id              = aws_subnet.public_subnet_ireland.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  user_data              = file("scripts/userdata.sh")
  tags = {
    Name = "monitoreo-${local.sufix}"
  }
}

variable "enable_monitoring" {
  description = "Habilita el despliegue de un servidor de monitoreo"
  #type        = bool
  type         = number
}

# variable "cadena" {
#   description = "Cadena de texto"
#   type        = string
#   default     = "ami-123,AMI-AAV,ami-12f"
# }

# variable "palabras" {
#   description = "Lista de palabras" 
#   type        = list(string)
#   default     = ["hola", "como", "estan"]  
# }

# variable "entornos" {
#   description = "Map de entornos"
#   type        = map(string)
#   default     = {
#     "prod"  = "10.10.0.0/16",
#     "dev"   = "172,16.0.0/16",    
#   }
# }



  # provisioner "local-exec" {
  #   command = "echo instancia creada con IP ${aws_instance.public_instance.public_ip} >> /noexiste/datos_instancia.txt"
  # }

  # provisioner "local-exec" {
  #   when    = destroy
  #   command = "echo instancia ${self.public_ip} Destruida >> datos_instancia.txt"
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "echo '<h1>Deployed via Terraform</h1>' | tee index.html"
  #   ]

  #   connection {
  #     type        = "ssh"
  #     host        = self.public_ip
  #     user        = "ec2-user"
  #     private_key = file("MyKey.pem")

  #   }
  # }

  #lifecycle {
  #create_before_destroy = true

  #prevent_destroy = true

  # ignore_changes = [ 
  #   ami,
  #   subnet_id
  #  ]

  # replace_triggered_by = [ 
  #   aws_subnet.private_subnet_ireland.id
  # ]
  #}
#}

  # provisioner "local-exec" {
  #   command = "echo instancia creada con IP ${aws_instance.private_instance.private_ip} >> datos_instancia.txt"
  # }

  # provisioner "local-exec" {
  #   when    = destroy
  #   command = "echo instancia ${self.private_ip} Destruida >> datos_instancia.txt"
  # }

  #lifecycle {
  #create_before_destroy = true

  #prevent_destroy = true

  # ignore_changes = [ 
  #   ami,
  #   subnet_id
  #  ]

  # replace_triggered_by = [ 
  #   aws_subnet.private_subnet_ireland.id
  # ]
#}

# resource "aws_instance" "myserver" {
#   ami                                  = "ami-091a906f2e1e40076"
#   instance_type                        = "t3.micro"
#   key_name                             = data.aws_key_pair.key.key_name
#   subnet_id                            = aws_subnet.public_subnet_ireland.id
#   tags                                 = {
#       "Name" = "MyServer"
#   }
#   vpc_security_group_ids               = [
#       aws_security_group.sg_public_instance.id
#   ]
# }
