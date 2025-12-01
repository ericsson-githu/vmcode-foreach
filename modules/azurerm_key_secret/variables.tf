
variable "secrets" {
  type = map(object({
    secret_name         = string
    secret_value        = string
    resource_group_name = string
    key_name            = string
  }))
}
