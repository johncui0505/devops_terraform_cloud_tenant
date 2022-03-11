terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = "0.7.1"
    }
  }
  required_version = ">=0.13.4"
}

provider "aci" {
  username = var.secret.user
  password = var.secret.pw
  url      = var.secret.url
  insecure = true
}

module "tenant" {
  source   = "https://github.com/johncui0505/devops_terraform_cloud_tenant/tree/main/module/tenant"
  for_each = var.tenants
  tenant   = each.value
}

output "tenant" {
  value = module.tenant
}
