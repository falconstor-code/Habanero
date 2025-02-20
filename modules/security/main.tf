resource "ibm_is_security_group" "customer_sg" {
  for_each = var.customers
  name     = "customer-${each.key}-sg"
  vpc      = var.vpc_ids[each.key]
} 

resource "ibm_is_security_group_rule" "allow_ssh" {
  for_each   = var.customers
  group      = ibm_is_security_group.customer_sg[each.key].id
  direction  = "inbound"
  protocol   = "tcp"
  port_min   = 22
  port_max   = 22
  remote     = "0.0.0.0/0" 
}

resource "ibm_is_security_group_rule" "allow_https" {
  for_each   = var.customers
  group      = ibm_is_security_group.customer_sg[each.key].id
  direction  = "inbound"
  protocol   = "tcp"
  port_min   = 443
  port_max   = 443
  remote     = "0.0.0.0/0"
} 
