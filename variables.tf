variable "region" {
  default = "us-south"
} 

variable "vpc_name_prefix" {
  default = "habanero-customer"
}

variable "customers" {
  type    = map(string)
  default = {
    "customer1" = "Customer One"
    "customer2" = "Customer Two"
  }
} 

variable "instance_profile" {
  default = "bx2-4x16"
}

variable "image" {
  default = "rockylinux-8"
} 

variable "cos_name" {
  default = "habanero-cos"
} 
