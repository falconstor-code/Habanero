resource "ibm_is_vpe" "customer_vpe" {
  for_each = var.customers
  name     = "vpe-${each.key}"
  vpc      = var.vpc_ids[each.key]
  target   = "cloud-object-storage"
}

resource "ibm_is_lb" "customer_lb" {
  for_each = var.customers
  name     = "customer-${each.key}-lb"
  vpc      = var.vpc_ids[each.key]
  type     = "private"
  region   = "us-south"
}
