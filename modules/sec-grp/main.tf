resource "aws_security_group" "sec-grp" {
 name        = var.name
 vpc_id      = var.vpc_id
 tags        = var.tags
}
# Ingress rules (IPv4 only)
resource "aws_vpc_security_group_ingress_rule" "ingress" {
 for_each = { for idx, rule in var.ingress_rules : idx => rule }
 security_group_id = aws_security_group.sec-grp.id
 from_port         = each.value.from_port
 to_port           = each.value.to_port
 ip_protocol       = each.value.protocol
 cidr_ipv4         = each.value.cidr_block
}
# Egress rules (IPv4 only)
resource "aws_vpc_security_group_egress_rule" "egress" {
 for_each = { for idx, rule in var.egress_rules : idx => rule }
 security_group_id = aws_security_group.sec-grp.id
 #from_port         = each.value.from_port
 #to_port           = each.value.to_port
 ip_protocol       = each.value.protocol
 cidr_ipv4         = each.value.cidr_block
}