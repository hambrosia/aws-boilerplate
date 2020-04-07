# Private Subnet - Server Security Group
resource "aws_security_group" "private_sub_server" {
  name        = local.sg_name_private_server
  description = "Allow TLS inbound traffic from ELB in public subnet, allow outbount to ELB in public subnet"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = local.sg_name_private_server
  }
}

resource "aws_security_group_rule" "private_sub_server_ingress" {
  # Rules are separated from SG to avoid cyclical dependency with referenced source/destination SGs
  description              = "TLS from ELB in public subnet"
  security_group_id        = aws_security_group.private_sub_server.id
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.public_elb.id
}

resource "aws_security_group_rule" "private_sub_server_egress" {
  description              = "TLS to ELB in public subnet"
  security_group_id        = aws_security_group.private_sub_server.id
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.public_elb.id
}

# Public Subnet - ELB Security Group
resource "aws_security_group" "public_elb" {
  name        = local.sg_name_public_elb
  description = "Allow TLS inbound traffic from Internet and outbound to EC2 instances in private subnet"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "TLS from Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = var.private_subnets
    security_groups = [aws_security_group.private_sub_server.id]
  }

  tags = {
    Name = local.sg_name_public_elb
  }
}