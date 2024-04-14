data cloudflare_ip_ranges cloudflare { }

locals {
  ipv4_cidr_blocks = data.cloudflare_ip_ranges.cloudflare.ipv4_cidr_blocks
  ipv6_cidr_blocks = data.cloudflare_ip_ranges.cloudflare.ipv6_cidr_blocks
}

resource aws_security_group cloudflare_sg {
  name        = "cloudflare"
  description = "Cloudflare security group"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  for_each = toset(local.ipv4_cidr_blocks)

  security_group_id = aws_security_group.cloudflare_sg.id
  cidr_ipv4         = each.key
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  for_each = toset(local.ipv4_cidr_blocks)

  security_group_id = aws_security_group.cloudflare_sg.id
  cidr_ipv4         = each.key
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_https_ipv4" {
  for_each = toset(local.ipv4_cidr_blocks)

  security_group_id = aws_security_group.cloudflare_sg.id
  cidr_ipv4         = each.key
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_http_ipv4" {
  for_each = toset(local.ipv4_cidr_blocks)

  security_group_id = aws_security_group.cloudflare_sg.id
  cidr_ipv4         = each.key
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv6" {
  for_each = toset(local.ipv6_cidr_blocks)

  security_group_id = aws_security_group.cloudflare_sg.id
  cidr_ipv6         = each.key
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv6" {
  for_each = toset(local.ipv6_cidr_blocks)

  security_group_id = aws_security_group.cloudflare_sg.id
  cidr_ipv6         = each.key
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_https_ipv6" {
  for_each = toset(local.ipv6_cidr_blocks)

  security_group_id = aws_security_group.cloudflare_sg.id
  cidr_ipv6         = each.key
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_http_ipv6" {
  for_each = toset(local.ipv6_cidr_blocks)

  security_group_id = aws_security_group.cloudflare_sg.id
  cidr_ipv6         = each.key
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}