#########################   EC2 FILTER   ##############################
// Create aws_ami filter to pick up the ami available in your region
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



# WEBSERVER INSTANCE FOR AWS

// Configure the EC2 instance in a private subnet

resource "aws_instance" "ec2_web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.vyos_instance_type
  key_name                    = var.key_pair
  availability_zone           = var.availability_zone

  depends_on = [
    aws_network_interface.web_private_nic_01,
    aws_instance.vyos
  ]

  user_data       = <<-EOF
              #!/bin/bash
              sudo apt  update & upgrade -y
              sudo apt install -y nginx

              # Create index.html in the default NGINX web directory
              echo "<h1>Hello!! VyOS Community in WMC2025 !!! ;)</h1>" | sudo tee /var/www/html/index.html

              # Update NGINX to listen on port 8080
              sudo sed -i 's/listen 80 default_server;/listen 8080 default_server;/g' /etc/nginx/sites-available/default

              # Restart NGINX to apply the changes
              sudo systemctl restart nginx
              EOF

  network_interface {
    network_interface_id = aws_network_interface.web_private_nic_01.id
    device_index         = 0
  }

  tags = {
    Name = "${var.prefix}-${var.web_instance_name}"
  }
}

# NETWORK INTERFACES

resource "aws_network_interface" "web_private_nic_01" {
  subnet_id       = aws_subnet.private_subnet_01.id
  security_groups = [aws_security_group.private_sg.id]
  private_ips     = [var.web_priv_nic_01_ip_address]
  source_dest_check = false

  tags = {
    Name = "${var.prefix}-${var.web_instance_name}-PrivateNIC"
  }
}