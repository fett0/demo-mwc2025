# SECURITY GROUP FOR PUBLIC RESOURCES

resource "aws_security_group" "public_sg" {
  name        = join("-", [var.prefix, var.public_sg_name])
  description = "Security Group for public resources"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH from MyIP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "WEBSERVER Port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = join("-", [var.prefix, var.public_sg_name])
  }
}

# SECURITY GROUP FOR PRIVATE RESOURCES

resource "aws_security_group" "private_sg" {
  name        = join("-", [var.prefix, var.private_sg_name])
  description = "Security Group for private resources"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = join("-", [var.prefix, var.private_sg_name])
  }
}