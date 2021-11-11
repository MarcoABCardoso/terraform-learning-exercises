provider "ibm" {
  ibmcloud_api_key = var.ibm_api_key
}

data "ibm_resource_group" "group" {
    name = "default" 
}

resource "ibm_container_cluster" "cluster" {
  name            = "test"
  datacenter      = "dal10"
  machine_type    = "free"
  hardware        = "shared"

  default_pool_size = 1

  labels = {
    "test" = "test-pool"
  }
}