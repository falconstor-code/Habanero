resource "ibm_is_vpc" "customer_vpc" {
  for_each       = var.customers
  name           = "${var.vpc_name_prefix}-${each.key}"
  resource_group = "Default"
} 

resource "ibm_is_subnet" "customer_subnet" {
  for_each            = var.customers
  name                = "${var.vpc_name_prefix}-${each.key}-subnet"
  vpc                 = ibm_is_vpc.customer_vpc[each.key].id
  zone                = "us-south-1"
  ipv4_cidr_block     = "172.16.${each.key}.${each.key}.0/24"
} 
