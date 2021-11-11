variable ibm_api_key {
    type = string
}
variable resource_group {
    type = string
    default = "default"
}
variable logdna_service_name {
    type = string
    default = "my-logdna-instance"
}
variable logdna_bind_resource_key {
    type = bool
    default = true
}
variable logdna_plan {
    type = string
    default = "lite"
}
variable logdna_region {
    type = string
    default = "us-south"
}
variable logdna_tags {
    type = list(string)
    default = ["created_by_terraform"]
}
variable logdna_resource_key_name {
    type = string
    default = "logdna-resource-key"
}
variable logdna_role {
    type = string
    default = "Manager"
}
variable logdna_resource_key_tags {
    type = list(string)
    default = ["created_by_terraform"]
}