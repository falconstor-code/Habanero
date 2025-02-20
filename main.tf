terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "~> 1.53.0"
    }
  }
}
provider "ibm" {
  region = var.region
}

# VPC Module
module "vpc" {
  source          = "./modules/vpc"
  region          = var.region
  vpc_name_prefix = var.vpc_name_prefix
  customers       = var.customers
}

# Compute Module
module "compute" {
  source              = "./modules/compute"
  vpc_ids             = module.vpc.vpc_ids 
  customer_subnets    = module.vpc.customer_subnet_ids 
  customers           = var.customers 
  instance_profile    = var.instance_profile 
  image               = var.image
} 

# Security Module
module "security" {
  source     = "./modules/security"
  vpc_ids    = module.vpc.vpc_ids
  customers  = var.customers
}

# Storage Module
module "storage" {
  source    = "./modules/storage"
  cos_name  = var.cos_name
  customers = var.customers
} 

# Networking Module
module "networking" {
  source        = "./modules/networking"
  vpc_ids       = module.vpc.vpc_ids
  cos_ids       = module.storage.cos_ids
  customers     = var.customers
}
