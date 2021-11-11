provider "ibm" {
  ibmcloud_api_key = var.ibm_api_key
}

data "ibm_resource_group" "group" {
    name = "default" 
}

resource "ibm_cr_namespace" "cr_namespace" {
    name = "my-terraform-namepsace"        
    resource_group_id = data.ibm_resource_group.group.id    
}

resource "ibm_cr_retention_policy" "cr_retention_policy" {
    namespace = ibm_cr_namespace.cr_namespace.id        
    images_per_repo = 10    
}

resource "ibm_iam_user_policy" "policy" {
    ibm_id = var.user_email       
    roles  = ["Manager"]
    resources {
        service              = "container-registry"            
        resource = ibm_cr_namespace.cr_namespace.id            
        resource_type = "namespace"            
        region = var.region        
    }
}