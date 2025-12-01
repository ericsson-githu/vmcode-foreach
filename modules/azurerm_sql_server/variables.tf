variable "sql_server_child" {
  type = map(object({
    name = string
    resource_group_name = string
    location = string
    version = string
    public_network_access_enabled = bool
    administrator_login = optional(string)
    administrator_login_password = optional(string)
    minimum_tls_version = optional(string)
    azuread_administrators = optional(list(object({
      login_username = string
      object_id      = string
 })))
  }))
}
