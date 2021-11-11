provider "ibm" {
  ibmcloud_api_key = var.ibm_api_key
}

data "ibm_resource_group" "logdna" {
  name = var.resource_group
}

module "logdna_instance" {
  source  = "terraform-ibm-modules/observability/ibm//modules/logging-logdna"

  bind_resource_key   = var.logdna_bind_resource_key
  service_name        = var.logdna_service_name
  resource_group_id   = data.ibm_resource_group.logdna.id
  plan                = var.logdna_plan
  region              = var.logdna_region
  tags                = var.logdna_tags
  resource_key_name   = var.logdna_resource_key_name
  role                = var.logdna_role
  resource_key_tags   = var.logdna_resource_key_tags
}
