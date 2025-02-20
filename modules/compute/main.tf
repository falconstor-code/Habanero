resource "ibm_is_instance" "storesafe" {
  for_each = var.customers
  name     = "storesafe-${each.key}"
  vpc      = var.vpc_ids[each.key]
  zone     = "us-south-1"
  profile  = var.instance_profile
  image    = var.image 

  primary_network_interface {
    subnet = var.customer_subnets[each.key]
  }
}
