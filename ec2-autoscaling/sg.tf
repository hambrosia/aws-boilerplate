# Private Subnet - Server Security Group
resource "aws_security_group" "private_sub_server" {
  name        = local.sg_name_private_server
  description = "Allow HTTP inbound traffic from ELB in public subnet, allow outbount to ELB in public subnet"
  vpc_id      = module.vpc.vpc_id
  tags = {
    Name = local.sg_name_private_server
  }
}

resource "aws_security_group_rule" "private_sub_server_ingress" {
  # Rules are separated from SG to avoid cyclical dependency with referenced source/destination SGs
  description              = "HTTP from ELB in public subnet"
  security_group_id        = aws_security_group.private_sub_server.id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.public_elb.id
}

resource "aws_security_group_rule" "private_sub_server_egress_nat" {
  description       = "Allow EC2 in private subnet to reach NAT gateway in public subnet"
  security_group_id = aws_security_group.private_sub_server.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
}

# Public Subnet - ELB Security Group
resource "aws_security_group" "public_elb" {
  name        = local.sg_name_public_elb
  description = "Allow HTTP inbound traffic from Internet and outbound to EC2 instances in private subnet"
  vpc_id      = module.vpc.vpc_id
  tags = {
    Name = local.sg_name_public_elb
  }
}

resource "aws_security_group_rule" "public_sub_elb_ingress" {
  description       = "HTTP from Internet to ELB in public subnet"
  security_group_id = aws_security_group.public_elb.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "public_sub_elb_egress" {
  description              = "HTTP to EC2 in private subnet"
  security_group_id        = aws_security_group.public_elb.id
  type                     = "egress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.private_sub_server.id
}