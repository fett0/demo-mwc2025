# THE LATEST AMAZON VYOS 1.4 IMAGE

data "aws_ami" "vyos" {
  most_recent = true

  filter {
    name   = "name"
    values = ["VyOS 1.4*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["131970628332"]
}


# VYOS INSTANCE

resource "aws_instance" "vyos" {
  ami               = data.aws_ami.vyos.id
  instance_type     = var.vyos_instance_type
  key_name          = var.key_pair
  availability_zone = var.availability_zone

  user_data_base64 = base64encode(templatefile("${path.module}/files/vyos_user_data.tfpl", {
  }))

  depends_on = [
    aws_network_interface.vyos_public_nic,
    aws_network_interface.vyos_private_nic_01,
  ]

  network_interface {
    network_interface_id = aws_network_interface.vyos_public_nic.id
    device_index         = 0
  }

  network_interface {
    network_interface_id = aws_network_interface.vyos_private_nic_01.id
    device_index         = 1
  }

  tags = {
    Name = "${var.prefix}-${var.vyos_instance_name}"
  }
}

# NETWORK INTERFACES

resource "aws_network_interface" "vyos_public_nic" {
  subnet_id       = aws_subnet.public_subnet.id
  security_groups = [aws_security_group.public_sg.id]
  private_ips     = [var.vyos_pub_nic_ip_address]

  source_dest_check = false

  tags = {
    Name = "${var.prefix}-${var.vyos_instance_name}-PublicNIC"
  }
}

resource "aws_network_interface" "vyos_private_nic_01" {
  subnet_id       = aws_subnet.private_subnet_01.id
  security_groups = [aws_security_group.private_sg.id]
  private_ips     = [var.vyos_priv_nic_01_ip_address]

  source_dest_check = false

  tags = {
    Name = "${var.prefix}-${var.vyos_instance_name}-PrivateNIC01"
  }
}

