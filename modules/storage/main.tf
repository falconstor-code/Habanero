resource "ibm_cos_bucket" "customer_bucket" {
  for_each              = var.customers
  bucket_name           = "customer-${each.key}-storage"
  storage_class         = "standard"
  region                = "us-south"
  resource_instance_id  = ibm_resource_instance.habanero_cos.id
} 
